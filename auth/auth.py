import streamlit as st
import psycopg
import bcrypt
from streamlit_authenticator import Hasher
from email_validator import validate_email, EmailNotValidError


def validate(email: str):
    try:
        validate_email(email)  # validate and get email info
        return True
    except EmailNotValidError:  # catch invalid emails
        st.error("Email inválido.")
        return False


def connect_to_db():
    try:
        connection_string = st.secrets["database"]["connection_string"]
        connection = psycopg.connect(connection_string, prepare_threshold=None)

        return connection
    except Exception as e:
        st.error(f"Erro ao tentar conexão com o banco de dados:\n {e}")

        return False


def login_validation(email_input: str, psswd_input: str):
    if not validate(email_input):
        return False

    connection = connect_to_db()
    if not connection:
        return False

    try:
        # Usamos 'with' para garantir que o cursor feche
        with connection.cursor() as cursor:

            # 1. Encontre o usuário
            cursor.execute(
                "SELECT hash_psswd FROM users WHERE email = %s", (email_input,)
            )
            data = cursor.fetchone()

            if data:
                # 2. Usuário encontrado, pegar o hash salvo
                stored_hashed_password = data[0].encode("utf-8")
                password_bytes = psswd_input.encode("utf-8")

                # 3. Verificar a senha digitada contra o hash salvo
                if bcrypt.checkpw(password_bytes, stored_hashed_password):
                    return True  # Senha correta!

            st.error("Email ou Senha incorretos.")
            return False  # Usuário não encontrado ou senha incorreta

    except Exception as e:
        st.error(f"Erro durante a verificação: {e}")
        return False


def hash_psswd(psswd: str):
    return Hasher().hash(password=psswd)
