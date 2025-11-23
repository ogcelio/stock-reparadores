import streamlit as st
import base64
import tomli_w
import tomllib
from auth.auth import connect_to_db, login_validation
from __init__ import __init__


__init__()
# ARQUIVO DE CONFIGS BASICAS
with open("config.toml", "rb") as config_file:
    config_data = tomllib.load(config_file)
    DATA_PATH = config_data["data_path"]
    BACKGROUND_PATH = config_data["background_path"]
    MAIN_PAGE_PATH = config_data["main_page_path"]
    COMP_PAGE_PATH = config_data["comp_page_path"]
    del config_data


# --- CONFIGURAÇÃO DA IMAGEM DE FUNDO ---


# Função para carregar e codificar a imagem
def get_base64_of_bin_file(bin_file):
    with open(bin_file, "rb") as f:
        image_data = f.read()
    return base64.b64encode(image_data).decode()


# Definindo o comportamento da imagem de fundo
def set_png_as_page_bg(png_file):
    bin_str = get_base64_of_bin_file(png_file)
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

    /* 2. Tornar o contêiner de CONTEÚDO (.main) transparente */
    [data-testid="stAppViewContainer"] > .main {{
        background-color: transparent;
    }}

    /* 3. Tornar Header e Sidebar transparentes */
    [data-testid="stSidebar"], [data-testid="stHeader"] {{
        background-color: transparent;
    }}

    /* 4. Opcional: Adicionar um leve fundo aos widgets para legibilidade */
    /*
    div[data-testid="stVerticalBlock"] div[data-testid="stExpander"] {{
         background-color: rgba(255, 255, 255, 0.1);
         border-radius: 10px;
    }}
    */
    </style>
    """
    st.markdown(page_bg_img, unsafe_allow_html=True)


# Colocando imagem no fundo
try:
    set_png_as_page_bg(BACKGROUND_PATH)
except Exception as e:
    st.error(f"Ocorreu um erro ao carregar a imagem: {e}")

data = {
    "user_data": {"email": "", "username": "", "role": ""},
    "login_data": {"first_login": True},
}

# INCIALIZANDO
if "logged_in" not in st.session_state:
    st.session_state.logged_in = False

    with open(DATA_PATH, "wb") as file:
        tomli_w.dump(data, file)


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

        col1, col2 = st.columns(2)

        with col1:
            forgot_psswd = st.html(
                '<p style=margin-top:8px; color:#154722><a href="https://www.google.com.br/?hl=pt-BR">Esqueceu a Senha?</a></p>'
            )  # MUDE O GOOGLE PARA OUTRO SITE
        with col2:
            remember_me_box = st.checkbox("Lembrar Senha")

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


if not st.session_state.logged_in:
    login()
else:
    st.navigation([MAIN_PAGE_PATH]).run()
