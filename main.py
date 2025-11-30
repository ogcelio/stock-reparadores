import streamlit as st
import base64
import tomli_w
import tomllib
from auth.auth import connect_to_db, login_validation
from __init__ import __init__


__init__()
# COLETANDO CAMINHOS DE CADA ARQUIVO NECESSARIO
with open("config.toml", "rb") as config_file:
    config_data = tomllib.load(config_file)
    DATA_PATH = config_data["data_path"]
    BACKGROUND_PATH = config_data["background_path"]
    MAIN_PAGE_PATH = config_data["main_page_path"]
    del config_data


# --- CONFIGURACAO DA IMAGEM DE FUNDO ---


# FUNCAO PARA CODIFICAR A IMAGEM DE FUNDO
def get_base64(bin_file):
    with open(bin_file, "rb") as f:
        image_data = f.read()
    return base64.b64encode(image_data).decode()


# FUNCAO PARA CRIAR E DEFINIR O COMPORTAMENDO DA IMAGEM DE FUNDO
def set_background(png_file):
    bin_str = get_base64(png_file)
    page_bg_img = f"""
    <style>
    /* 1. Aplicar a imagem */
    [data-testid="stAppViewContainer"] {{
        background-image: url("data:image/png;base64,{bin_str}");
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        background-attachment: fixed; /* Imagem fica fixa ao rolar */
    }}

    /* Tornar o contêiner de CONTEÚDO (.main) transparente */
    [data-testid="stAppViewContainer"] > .main {{
        background-color: transparent;
    }}

    /* Header transparente */
    [data-testid="stHeader"] {{
        background-color: transparent;
    }}
    </style>
    """
    st.markdown(page_bg_img, unsafe_allow_html=True)


# COLOCANDO A IMAGEM DE FUNDO
try:
    set_background(BACKGROUND_PATH)
except Exception as e:
    st.error(f"Ocorreu um erro ao carregar a imagem: {e}")

# INCIALIZANDO
data = {
    "user_data": {"email": "", "username": "", "role": ""},
    "login_data": {"first_login": True},
}

if "logged_in" not in st.session_state:
    st.session_state.logged_in = False

    with open(DATA_PATH, "wb") as file:
        tomli_w.dump(data, file)


# FUNCAO PARA CRIAR OS WIDGETS DE LOGIN
def login():
    st.title("Bem-vindo ao Stock-Reparadores!")
    st.divider()
    st.subheader("Acesse a sua conta:")

    with st.form("sign_in"):
        email_input = st.text_input("Email")
        password_input = st.text_input("Senha", type="password")

        submit_button = st.form_submit_button(
            label="Entrar", type="primary", use_container_width=True
        )

    if submit_button:
        if login_validation(email_input, password_input):
            global data
            data["user_data"]["email"] = email_input

            try:
                connection = connect_to_db()
                with connection.cursor() as cursor:
                    cursor.execute(
                        "SELECT username, user_role FROM users WHERE email = %s",
                        (email_input,),
                    )
                    user_data = cursor.fetchone()

                data["user_data"]["username"] = user_data[0]
                data["user_data"]["role"] = user_data[1]

                with open(DATA_PATH, "wb") as file:
                    tomli_w.dump(data, file)

                st.session_state.logged_in = True
                st.rerun()
            except Exception as e:
                st.error(f"Erro ao tentar salvar os dados: {e}")


# TESTE SE LOGIN FOI CONCLUIDO
if not st.session_state.logged_in:
    login()
else:
    st.navigation([MAIN_PAGE_PATH]).run()
