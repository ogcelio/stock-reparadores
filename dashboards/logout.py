import streamlit as st
import tomli_w
from common.funcs import import_data

st.session_state.logged_in = False

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

data = {
    "user_data": {"email": "", "username": "", "role": ""},
    "login_data": {"first_login": True},
}

with open(DATA_PATH, "wb") as file:
    tomli_w.dump(data, file)

# VOLTANDO PARA A TELA DE LOGIN
st.set_page_config(layout="centered")
st.navigation([LOGIN_PAGE_PATH]).run()
