import streamlit as st

# INCIALIZANDO
if "logged_in" not in st.session_state:
    st.session_state.logged_in = False

if not st.session_state.logged_in:
    st.title("Bem-vindo ao Stock-Reparadores!")
    st.divider()
    st.subheader("Entre com a sua Matrícula e Senha para acessar o sistema.")

    @st.dialog("ATENÇÃO:")
    def login_validation(username_input: str, password_input: str):
        correct_username = "admin"
        correct_password = "admin"

        if not username_input.replace(" ", "") or not password_input.replace(" ", ""):
            st.error("Por favor, preencha os campos solicitados.")
        elif username_input == correct_username and password_input == correct_password:
            st.session_state.logged_in = True
            st.rerun()
        else:
            st.error("erro desconhecido. digite novamente")

    with st.form("sign_in"):
        username = st.text_input("Matrícula")
        password = st.text_input("Senha", type="password")

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
        login_validation(username, password)

else:
    st.success("Login realizado com sucesso")
    st.title("Tela Principal")
