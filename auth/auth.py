import streamlit as st
import psycopg
import bcrypt
from streamlit_authenticator import Hasher
from email_validator import validate_email, EmailNotValidError


# FUNCAO PARA VALIDAR EMAILS
@st.cache_data
def validate(email: str):
    try:
        validate_email(email)
        return True
    except EmailNotValidError:
        st.error("Email inválido.")
        return False


# FUNCAO PARA CRIAR UMA CONEXAO COM O BD
@st.cache_resource
def connect_to_db():
    try:
        connection_string = st.secrets["database"]["connection_string"]
        connection = psycopg.connect(connection_string, prepare_threshold=None)
        return connection
    except Exception as e:
        st.error(f"Erro ao tentar conexão com o banco de dados:\n {e}")
        return False


# FUNCAO PARA REALIZAR O LOGIN DO USER
@st.cache_data
def login_validation(email_input: str, psswd_input: str):
    if not validate(email_input):
        return False

    connection = connect_to_db()
    if not connection:
        return False

    try:
        with connection.cursor() as cursor:
            # PESQUISANDO A SENHA DO USER
            cursor.execute(
                "SELECT hash_psswd FROM users WHERE email = %s", (email_input,)
            )
            data = cursor.fetchone()

            if data:
                # COLETANDO A SENHA
                stored_hashed_password = data[0].encode("utf-8")
                password_bytes = psswd_input.encode("utf-8")

                # COMPARANDO A SENHA
                if bcrypt.checkpw(password_bytes, stored_hashed_password):
                    return True  # CORRETO

            st.error("Email ou Senha incorretos.")
            return False

    except Exception as e:
        st.error(f"Erro durante a verificação: {e}")
        return False


# FUNCAO PARA CRIAR O HASH DAS SENHAS
@st.cache_data
def hash_psswd(psswd: str):
    return Hasher().hash(password=psswd)
