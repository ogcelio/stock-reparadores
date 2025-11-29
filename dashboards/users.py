import streamlit as st
import tomllib
import tomli_w
from auth.auth import connect_to_db, validate, hash_psswd


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
    LOGOUT_PAGE_PATH = config_data["logout_page_path"]
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
        st.Page(LOGOUT_PAGE_PATH, title="Sair"),
    ],
}

pg = st.navigation(pages, position="top")

if pg.title == "Seus Componentes":
    st.navigation([COMP_PAGE_PATH]).run()
elif pg.title == "Dashboard Principal":
    st.navigation([MAIN_PAGE_PATH]).run()
elif pg.title == "Sair":
    st.navigation([LOGOUT_PAGE_PATH]).run()
else:
    st.title("Usuários cadastrados no sistema:")
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
    st.write(
        'Para deletar um usuário, basta selecionar qualquer informação dele e depois clicar em "Apagar o Usuário Selecionado".'
    )

    def delete_user() -> None:
        global connection, user_email
        try:
            with connection.cursor() as cursor:
                sql_deletion = "DELETE FROM users WHERE email=%s"
                cursor.execute(sql_deletion, (user_email,))
            connection.commit()
            st.success("Usuário deletado com sucesso!")
        except Exception as e:
            connection.rollback()
            print(f"ERRO AO DELETAR USUARIO: {e}")

    # ALGORITMO PRA DELETAR USUARIO
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

    # ALGORITMO PARA ADICIONAR USUARIO
    def add_user(name, email, psswd, user_role, phone=None) -> None:
        global connection

        all_valid = True
        # VALIDANDO EMAIL
        if not validate(email):
            all_valid = False

        # CONVERTENDO E VALIDANDO USER ROLE
        if user_role == "Funcionário":
            user_role = "employee"
        elif user_role == "Administrador":
            user_role = "admin"
        else:
            all_valid = False

        # VALIDANDO TELEFONE
        if phone:
            for digit in phone:
                if not digit.isdigit():
                    phone = phone.replace(digit, "")
            if len(phone) > 11 or len(phone) < 8:
                st.error(
                    "O número de telefone digitado não é válido. Digite apenas o DDD e o próprio número."
                )
                all_valid = False

        # VALIDANDO SENHA
        if not psswd:
            st.error("Digite uma senha.")
            all_valid = False

        # VALIDANDO NOME
        if not name:
            st.error("Digite o nome do usuário.")
            all_valid = False

        if all_valid:
            # FAZENDO HASH DA SENHA:
            password = hash_psswd(psswd)
            try:
                with connection.cursor() as cursor:
                    if phone:
                        sql_insertion = "INSERT INTO users (email, hash_psswd, username, phone, user_role) VALUES (%s, %s, %s, %s, %s)"
                        cursor.execute(
                            sql_insertion,
                            (
                                email,
                                password,
                                name,
                                phone,
                                user_role,
                            ),
                        )
                        connection.commit()
                    else:
                        sql_insertion = "INSERT INTO users (email, hash_psswd, username, user_role) VALUES (%s, %s, %s, %s)"
                        cursor.execute(
                            sql_insertion,
                            (
                                email,
                                password,
                                name,
                                user_role,
                            ),
                        )
                        connection.commit()

                    st.success("Usuário adicionado com sucesso!")
            except Exception as e:
                connection.rollback()
                print(f"ERRO AO ADICIONAR USUARIO: {e}")

    col1, col2 = st.columns(2)
    with col1:
        st.subheader("Adicionar usuário")
        name = st.text_input(
            label="Digite o nome do usuário: *",
            max_chars=128,
        )
        email = st.text_input(label="Digite o Email do Usuário: *", max_chars=128)
        psswd = st.text_input(label="Digite uma Senha para o Usuário: *", max_chars=255)
        phone = st.text_input(label="Digite o Número de telefone do Usuário:")
        user_role = st.radio(
            label="Selecione a Função do Usuário: *",
            options=("Funcionário", "Administrador"),
        )
        st.write("Todas as opções terminadas com * devem ser preenchidas/selecionadas.")
        yes_button = st.button(
            "Adicionar Usuário",
            type="primary",
            on_click=lambda: add_user(name, email, psswd, user_role, phone),
        )
