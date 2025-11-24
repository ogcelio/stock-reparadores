import streamlit as st
import tomllib
import tomli_w
from auth.auth import connect_to_db


# --- PROTETOR DA PAGINA ---
if not st.session_state.get("logged_in", False):
    st.error("Você precisa estar logado para ver esta página.")
    st.warning("Redirecionando para a tela de login...")
    st.switch_page("main.py")
    st.stop()

# ARQUIVO DE CONFIGS BASICAS
with open("config.toml", "rb") as config_file:
    config_data = tomllib.load(config_file)
    DATA_PATH = config_data["data_path"]
    MAIN_PAGE_PATH = config_data["main_page_path"]
    COMP_PAGE_PATH = config_data["comp_page_path"]
    MY_ACCOUNT_PAGE_PATH = config_data["my_account_page_path"]
    USERS_PAGE_PATH = config_data["users_page_path"]
    TABLE_NAMES = config_data["table_names"]
    del config_data

# COLETANDO INFO SOBRE O USUARIO
with open(DATA_PATH, "rb") as data_file:
    data = tomllib.load(data_file)
    email = data["user_data"]["email"]
    role = data["user_data"]["role"]

# --- PROTETOR PARA ADMS
if role != "admin":
    st.error("Você precisa ser administrador para ver esta página.")
    st.warning("Redirecionando para a tela principal...")
    st.navigation([MAIN_PAGE_PATH]).run()
    st.stop()

pages = {
    "Stock Reparadores": [
        st.Page(MAIN_PAGE_PATH, title="Dashboard Principal"),
        st.Page(COMP_PAGE_PATH, title="Seus Componentes"),
        st.Page(USERS_PAGE_PATH, title="Usuários"),
    ],
    "Minha Conta": [
        st.Page(MY_ACCOUNT_PAGE_PATH, title="Gerenciar Conta"),
    ],
}

pg = st.navigation(pages, position="top")

if pg.title == "Seus Componentes":
    st.navigation([COMP_PAGE_PATH]).run()
elif pg.title == "Dashboard Principal":
    st.navigation([MAIN_PAGE_PATH]).run()
elif pg.title == "Gerenciar Conta":
    st.navigation([MY_ACCOUNT_PAGE_PATH]).run()
else:
    connection = connect_to_db()
    with connection.cursor() as cursor:
        cursor.execute("SELECT username, email, user_role FROM users")
        db_users = cursor.fetchall()

    users = {"Nome": [], "Email": [], "Função": []}

    for user in db_users:
        users["Nome"].append(user[0])
        users["Email"].append(user[1])
        if user[2] == "admin":
            users["Função"].append("Administrador")
        elif user[2] == "employee":
            users["Função"].append("Empregado")
        else:
            users["Função"].append(user[2])

    event = st.dataframe(
        users,
        key="data",
        on_select="rerun",
        selection_mode=["single-cell"],
        hide_index=True,
    )

    add_user = st.button(label="Adicionar Usuário", type="primary")

    def delete_user() -> None:
        global connection, user_email
        try:
            with connection.cursor() as cursor:
                sql_deletion = "DELETE FROM users WHERE email=%s"
                cursor.execute(sql_deletion, (user_email,))
            connection.commit()
        except Exception as e:
            connection.rollback()
            print(f"ERRO AO DELETAR USUARIO: {e}")

    # AGORA, PRECISO ADICIONAR UMA FUNC PRA ADICIONAR PESSOAS E TOMAR CUIDADO COM SQL INJECTION EM TODAS AS CONSULTAS
    if event["selection"]["cells"]:
        row = event["selection"]["cells"][0][0]
        user_email = users["Email"][row]

        del_user = st.button(label="Apagar o Usuário Selecionado", type="secondary")

        if del_user:
            with st.form("del_form"):
                st.warning(
                    f"Você tem certeza que você quer deletar o usuário {users['Nome'][row]}? Essa é uma ação irreversível e que acarretará na perda de todos os dados deste usuário."
                )

                col1, col2 = st.columns(2)

                with col1:
                    no_button = st.form_submit_button(
                        "Não, cancelar ação.", type="primary"
                    )

                with col2:
                    yes_button = st.form_submit_button(
                        "Sim, deletar usuário.",
                        type="secondary",
                        on_click=delete_user,
                    )
