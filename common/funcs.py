import streamlit as st
import tomllib


@st.cache_resource
def import_data():
    # ARQUIVO DE CONFIGS BASICAS
    with open("config.toml", "rb") as config_file:
        config_data = tomllib.load(config_file)
        DATA_PATH = config_data["data_path"]
        BACKGROUND_PATH = config_data["background_path"]
        MAIN_PAGE_PATH = config_data["main_page_path"]
        COMP_PAGE_PATH = config_data["comp_page_path"]
        LOGOUT_PAGE_PATH = config_data["logout_page_path"]
        USERS_PAGE_PATH = config_data["users_page_path"]
        TABLE_NAMES = config_data["table_names"]
        LOGIN_PAGE_PATH = config_data["login_page_path"]
        del config_data

    return (
        DATA_PATH,
        BACKGROUND_PATH,
        MAIN_PAGE_PATH,
        COMP_PAGE_PATH,
        LOGOUT_PAGE_PATH,
        USERS_PAGE_PATH,
        LOGIN_PAGE_PATH,
        TABLE_NAMES,
    )


@st.cache_resource
def navigation_pages(
    role, MAIN_PAGE_PATH, COMP_PAGE_PATH, LOGOUT_PAGE_PATH, USERS_PAGE_PATH
):
    # DIFERENCIANDO O QUE O ADMIN E O FUNCIONARIO PODEM VER
    if role == "employee":
        pages = {
            "Stock Reparadores": [
                st.Page(MAIN_PAGE_PATH, title="Dashboard Principal"),
                st.Page(COMP_PAGE_PATH, title="Seus Componentes"),
            ],
            "Minha Conta": [
                st.Page(LOGOUT_PAGE_PATH, title="Sair"),
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
                st.Page(LOGOUT_PAGE_PATH, title="Sair"),
            ],
        }
    else:
        pages = {
            "Minha Conta": [
                st.Page(LOGOUT_PAGE_PATH, title="Sair"),
            ],
        }

    return pages
