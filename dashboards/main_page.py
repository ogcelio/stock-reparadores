import streamlit as st
import tomllib
import tomli_w
from auth.auth import connect_to_db
from common.funcs import import_data, navigation_pages

# --- INÍCIO: Protetor da Página ---
if not st.session_state.get("logged_in", False):
    st.error("Você precisa estar logado para ver esta página.")
    st.warning("Redirecionando para a tela de login...")
    st.switch_page("main.py")
    st.stop()
# --- FIM: Protetor da Página ---

# DADOS E PATHS BASICOS
(
    DATA_PATH,
    BACKGROUND_PATH,
    MAIN_PAGE_PATH,
    COMP_PAGE_PATH,
    LOGOUT_PAGE_PATH,
    USERS_PAGE_PATH,
    LOGIN_PAGE_PATH,
    TABLE_NAMES,
) = import_data()


with open(DATA_PATH, "rb") as data_file:
    data = tomllib.load(data_file)

role = data["user_data"]["role"]

# PAGINAS DO MENU SUPERIOR (OU LATERAL NO MOBILE)
pages = navigation_pages(
    role, MAIN_PAGE_PATH, COMP_PAGE_PATH, LOGOUT_PAGE_PATH, USERS_PAGE_PATH
)

pg = st.navigation(pages, position="top")

if pg.title == "Seus Componentes":
    st.navigation([COMP_PAGE_PATH]).run()
elif pg.title == "Usuários":
    st.navigation([USERS_PAGE_PATH]).run()
elif pg.title == "Sair":
    st.navigation([LOGOUT_PAGE_PATH]).run()
else:
    # CRIANDO TABELA DE COMPONENTES EM BAIXA QUANTIDADE
    def low_comp():
        global connection
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

                    comp_id = component[1]
                    sql_search = (
                        f"SELECT * FROM {TABLE_NAMES[component[0]]} WHERE comp_id = %s"
                    )
                    cursor.execute(sql_search, (comp_id,))
                    component_data = cursor.fetchone()

                    name = f"{component[0]} "
                    for item in component_data[1:]:
                        name += f"{item} "

                    table["Componente"].append(name)

                return table
            else:
                return False

    # --- CONTEUDO NORMAL DA PAGINA ---
    st.set_page_config(layout="wide")
    st.title("Dashboard Principal")

    if data["login_data"]["first_login"]:
        st.success(f"Bem-Vindo, {data['user_data']['username']}.")

        with open(DATA_PATH, "wb") as file:
            data["login_data"]["first_login"] = False
            tomli_w.dump(data, file)

    connection = connect_to_db()

    low_comp_table = low_comp()

    if low_comp_table:
        st.header("Componentes em baixa quantidade:")

        event = st.dataframe(
            low_comp_table,
            key="data",
            on_select="rerun",
            selection_mode=["single-cell"],
            hide_index=True,
        )

    # DIVISOR
    st.divider()

    # LINKS PARA OUTRAS JANELAS
    col1, col2 = st.columns(2)
    with col1:
        st.page_link(COMP_PAGE_PATH, label="Gerenciar componentes no estoque")

    if role == "admin":
        with col2:
            st.page_link(USERS_PAGE_PATH, label="Gerenciar usuários cadastrados")
