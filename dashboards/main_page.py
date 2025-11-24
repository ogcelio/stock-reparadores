import streamlit as st
import tomllib
import tomli_w
from auth.auth import connect_to_db

# --- INÍCIO: Protetor da Página ---
if not st.session_state.get("logged_in", False):
    st.error("Você precisa estar logado para ver esta página.")
    st.warning("Redirecionando para a tela de login...")
    st.switch_page("main.py")
    st.stop()
# --- FIM: Protetor da Página ---

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

with open(DATA_PATH, "rb") as data_file:
    data = tomllib.load(data_file)

role = data["user_data"]["role"]

if role == "employee":
    pages = {
        "Stock Reparadores": [
            st.Page(MAIN_PAGE_PATH, title="Dashboard Principal"),
            st.Page(COMP_PAGE_PATH, title="Seus Componentes"),
        ],
        "Minha Conta": [
            st.Page(MY_ACCOUNT_PAGE_PATH, title="Gerenciar Conta"),
        ],
    }
elif role == "admin":
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
elif pg.title == "Usuários":
    st.navigation([USERS_PAGE_PATH]).run()
elif pg.title == "Gerenciar Conta":
    st.navigation([MY_ACCOUNT_PAGE_PATH]).run()
else:
    # --- Conteúdo Normal da Página ---
    st.set_page_config(layout="wide")
    st.title("Dashboard Principal")

    if data["login_data"]["first_login"]:
        st.success(f"Bem-Vindo, {data['user_data']['username']}.")

        with open(DATA_PATH, "wb") as file:
            data["login_data"]["first_login"] = False
            tomli_w.dump(data, file)

    # CRIANDO TABELA DE COMPONENTES EM BAIXA QUANTIDADE
    connection = connect_to_db()
    with connection.cursor() as cursor:
        cursor.execute(
            "SELECT C.category, C.id, C.quantity, S.supplier_name FROM components C JOIN suppliers S ON C.supplier_id = S.id WHERE C.quantity <= C.minimum_quantity"
        )
        collected_data = cursor.fetchall()

        if collected_data:
            table = {"ID": [], "Componente": [], "Quantidade": [], "Fornecedor": []}
            for component in collected_data:
                table["ID"].append(component[1])
                table["Quantidade"].append(component[2])
                table["Fornecedor"].append(component[3])
                # TOMAR CUIDADO COM SQL INJECTION
                cursor.execute(
                    f"SELECT * FROM {TABLE_NAMES[component[0]]} WHERE comp_id = {component[1]}"
                )
                component_data = cursor.fetchone()

                name = f"{component[0]} "
                for item in component_data[1:]:
                    name += f"{item} "

                table["Componente"].append(name)

            st.header("Componentes em baixa quantidade:")
            # st.dataframe(table, hide_index=True)
            event = st.dataframe(
                table,
                key="data",
                on_select="rerun",
                selection_mode=["single-cell"],
                hide_index=True,
            )

            if event["selection"]["cells"]:
                row = event["selection"]["cells"][0][0]
                comp_id = table["ID"][row]

                st.page_link(COMP_PAGE_PATH, label="Gerenciar o componente selecionado")

    # FIM TABELA DE COMPONENTES EM BAIXA QUANTIDADE
