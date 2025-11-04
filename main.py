import streamlit as st
import base64
import os

# --- CAMINHO PARA A IMAGEM DE FUNDO ---
try:
    # Pega o diretório absoluto do script que está sendo executado
    SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
except NameError:
    # Se estiver executando em um ambiente interativo (como um notebook)
    # que não define __file__, use o diretório de trabalho atual.
    SCRIPT_DIR = os.getcwd()

BACKGROUND_PATH = os.path.join(SCRIPT_DIR, "images", "background.png")

# --- CONFIGURAÇÃO DA IMAGEM DE FUNDO ---


# Função para carregar e codificar a imagem
def get_base64_of_bin_file(bin_file):
    with open(bin_file, "rb") as f:
        data = f.read()
    return base64.b64encode(data).decode()


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
except FileNotFoundError:
    st.error(f"Arquivo de imagem de fundo não encontrado em: {BACKGROUND_PATH}")
    st.info(
        "Verifique se o caminho está correto e se a estrutura de pastas é: [pasta_do_script]/dashboards/images/background.png"
    )
except Exception as e:
    st.error(f"Ocorreu um erro ao carregar a imagem: {e}")

# INCIALIZANDO
if "logged_in" not in st.session_state:
    st.session_state.logged_in = False


def login():
    st.title("Bem-vindo ao Stock-Reparadores!")
    st.divider()
    st.subheader("Entre com a sua Matrícula e Senha para acessar o sistema.")

    def login_validation(id_input: str, password_input: str):
        correct_id = "admin"
        correct_password = "admin"

        if not id_input.replace(" ", "") or not password_input.replace(" ", ""):
            st.error("Por favor, preencha os campos solicitados.")
        elif id_input == correct_id and password_input == correct_password:
            st.session_state.logged_in = True
            st.rerun()
        else:
            st.error("erro desconhecido. digite novamente")

    with st.form("sign_in"):
        id_input = st.text_input("Matrícula")
        password_input = st.text_input("Senha", type="password")

        submit_button = st.form_submit_button(
            label="Entrar", type="primary", use_container_width=True
        )

        col1, col2, col3 = st.columns(3)

        with col1:
            register_box = st.html(
                '<p style=margin-top:8px; color:#154722><a href="https://www.google.com.br/?hl=pt-BR">Solicitar Cadastro</a></p>'
            )  # MUDE O GOOGLE PARA OUTRO SITE
        with col2:
            register_box = st.html(
                '<p style=margin-top:8px; color:#154722><a href="https://www.google.com.br/?hl=pt-BR">Esqueceu a Senha?</a></p>'
            )  # MUDE O GOOGLE PARA OUTRO SITE
        with col3:
            remember_me_box = st.checkbox("Lembrar Senha")

    if submit_button:
        login_validation(id_input, password_input)


if not st.session_state.logged_in:
    login()
else:
    username = "carlos"
    st.success(f"Seja bem-vindo, {username}")
