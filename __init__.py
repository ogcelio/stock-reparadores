import tomli_w
import tomllib
from os.path import dirname, join, abspath
from os import getcwd
import streamlit as st


# DEFININDO PATHS
@st.cache_resource
def __init__() -> None:
    try:
        # CAMINHO PARA DESKTOP CONVENCIONAL
        SCRIPT_DIR = dirname(abspath(__file__))
    except NameError:
        # CAMINHO PARA NOTEBOOK (NAO DEFINE __file__)
        SCRIPT_DIR = getcwd()

    BACKGROUND_PATH = join(SCRIPT_DIR, "images", "background.png")
    DATA_PATH = join(SCRIPT_DIR, ".cache", "temp.toml")
    MAIN_PAGE_PATH = join(SCRIPT_DIR, "dashboards", "main_page.py")
    COMP_PAGE_PATH = join(SCRIPT_DIR, "dashboards", "components.py")
    LOGOUT_PAGE_PATH = join(SCRIPT_DIR, "dashboards", "logout.py")
    USERS_PAGE_PATH = join(SCRIPT_DIR, "dashboards", "users.py")
    LOGIN_PAGE_PATH = join(SCRIPT_DIR, "main.py")

    TABLE_NAMES = {
        "Capacitor": "capacitors",
        "Circuito Integrado": "integrated_circuits",
        "Memória": "memories",
        "Driver": "drivers",
        "Transistor": "transistors",
    }

    try:
        with open("config.toml", "rb") as config_file:
            config_data = tomllib.load(config_file)
        config_data["background_path"] = BACKGROUND_PATH
        config_data["data_path"] = DATA_PATH
        config_data["main_page_path"] = MAIN_PAGE_PATH
        config_data["comp_page_path"] = COMP_PAGE_PATH
        config_data["logout_page_path"] = LOGOUT_PAGE_PATH
        config_data["users_page_path"] = USERS_PAGE_PATH
        config_data["login_page_path"] = LOGIN_PAGE_PATH
    except FileNotFoundError:
        config_data = {
            "background_path": BACKGROUND_PATH,
            "data_path": DATA_PATH,
            "main_page_path": MAIN_PAGE_PATH,
            "comp_page_path": COMP_PAGE_PATH,
            "logout_page_path": LOGOUT_PAGE_PATH,
            "users_page_path": USERS_PAGE_PATH,
            "login_page_path": LOGIN_PAGE_PATH,
            "table_names": TABLE_NAMES,
        }

    with open("config.toml", "wb") as config_file:
        tomli_w.dump(config_data, config_file)
