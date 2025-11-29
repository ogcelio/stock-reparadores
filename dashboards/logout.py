import streamlit as st
import tomli_w
import tomllib

st.session_state.logged_in = False

with open("config.toml", "rb") as config_file:
    config_data = tomllib.load(config_file)
    DATA_PATH = config_data["data_path"]
    LOGIN_PAGE_PATH = config_data["login_page_path"]
    del config_data


data = {
    "user_data": {"email": "", "username": "", "role": ""},
    "login_data": {"first_login": True},
}

with open(DATA_PATH, "wb") as file:
    tomli_w.dump(data, file)

st.set_page_config(layout="centered")
st.navigation([LOGIN_PAGE_PATH]).run()
