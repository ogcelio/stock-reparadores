import streamlit as st
import tomllib
import tomli_w
from auth.auth import connect_to_db
from time import sleep

# --- PROTETOR DA PAGINA ---
if not st.session_state.get("logged_in", False):
    st.error("Você precisa estar logado para ver esta página.")
    st.warning("Redirecionando para a tela de login...")
    st.switch_page("main.py")
    st.stop()

# ARQUIVO DE CONFIGS BASICAS
with open("config.toml", "rb") as config_file:
    config_data = tomllib.load(config_file)
    DATA_PATH = config_data["data_path"]
    MAIN_PAGE_PATH = config_data["main_page_path"]
    COMP_PAGE_PATH = config_data["comp_page_path"]
    MY_ACCOUNT_PAGE_PATH = config_data["my_account_page_path"]
    USERS_PAGE_PATH = config_data["users_page_path"]
    TABLE_NAMES = config_data["table_names"]
    del config_data

# COLETANDO INFO SOBRE O USUARIO
with open(DATA_PATH, "rb") as data_file:
    data = tomllib.load(data_file)
    email = data["user_data"]["email"]
    role = data["user_data"]["role"]

# --- PROTETOR PARA ADMS
if role != "admin":
    st.error("Você precisa ser administrador para ver esta página.")
    st.warning("Redirecionando para a tela principal...")
    st.navigation([MAIN_PAGE_PATH]).run()
    st.stop()

pages = {
    "Stock Reparadores": [
        st.Page(MAIN_PAGE_PATH, title="Dashboard Principal"),
        st.Page(COMP_PAGE_PATH, title="Seus Componentes"),
        st.Page(USERS_PAGE_PATH, title="Usuários"),
    ],
    "Minha Conta": [
        st.Page(MY_ACCOUNT_PAGE_PATH, title="Gerenciar Conta"),
    ],
}

pg = st.navigation(pages, position="top")

if pg.title == "Dashboard Principal":
    st.navigation([MAIN_PAGE_PATH]).run()
elif pg.title == "Gerenciar Conta":
    st.navigation([MY_ACCOUNT_PAGE_PATH]).run()
elif pg.title == "Usuários":
    st.navigation([USERS_PAGE_PATH]).run()
else:
    # --- Conteúdo Normal da Página ---
    st.title("Componentes cadastrados")

    # CRIANDO TABELA DE COMPONENTES
    connection = connect_to_db()
    with connection.cursor() as cursor:
        cursor.execute(
            "SELECT C.category, C.id, C.quantity, C.manufacturer, C.link_datasheet FROM components C"
        )
        collected_data = cursor.fetchall()

        if collected_data:
            table = {
                "ID": [],
                "Componente": [],
                "Quantidade": [],
                "Fabricante": [],
                "Datasheet": [],
            }
            for component in collected_data:
                table["ID"].append(component[1])
                table["Quantidade"].append(component[2])
                if component[3]:
                    table["Fabricante"].append(component[3])
                else:
                    table["Fabricante"].append("Desconhecido.")

                if component[4]:
                    table["Datasheet"].append(component[4])
                else:
                    table["Datasheet"].append("Não Registrado.")

                comp_id = component[1]
                sql_search = (
                    f"SELECT * FROM {TABLE_NAMES[component[0]]} WHERE comp_id = %s"
                )
                cursor.execute(sql_search, (comp_id,))

                component_data = cursor.fetchone()

                name = f"{component[0]} "
                for item in component_data[1:]:
                    if item:
                        name += f"{item} "

                table["Componente"].append(name)

        event = st.dataframe(
            table,
            key="data",
            on_select="rerun",
            selection_mode=["single-cell"],
            hide_index=True,
        )

        st.write(
            'Para deletar um componente, basta selecionar qualquer informação dele e depois clicar em "Apagar o componente selecionado".'
        )

        if event["selection"]["cells"]:
            row = event["selection"]["cells"][0][0]
            comp_id = table["ID"][row]

            edit_component_button = st.button(
                "Editar componente selecionado", type="primary"
            )
            del_component_button = st.button(
                "Deletar componente selecionado", type="secondary"
            )

    def add_comp(args: tuple):
        global connection
        if args[0] == "Capacitor":
            sql_insertion = str(
                """
                WITH new_comp AS (
                INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id, link_datasheet)
                VALUES (
                        %s, -- Categoria
                        %s, -- Qtd Atual
                        %s, -- Qtd Minima
                        %s, -- Fabricante
                        (SELECT id FROM suppliers WHERE supplier_name = %s), -- Fornecedor
                        %s -- Link Datasheet
                    )
                    RETURNING id
                )
                INSERT INTO capacitors (comp_id, capacitance, max_voltage, cap_type, encapsulation)
                VALUES ((SELECT id FROM new_comp), 
                %s, -- Capacitancia
                %s, -- Tensao Maxima 
                %s, -- Tipo do capacitor 
                %s -- Encapsulamento
                )
                """
            )

        else:
            sql_insertion = str(
                f"""
                WITH new_comp AS (
                INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id, link_datasheet)
                    VALUES (
                        %s, -- Categoria
                        %s, -- Qtd Atual 
                        %s, -- Qtd Minima 
                        %s, -- Fabricante 
                        (SELECT id FROM suppliers WHERE supplier_name = %s), -- Fornecedor
                        %s -- Link Datasheet
                    )
                    RETURNING id
                ) 
                INSERT INTO {TABLE_NAMES[args[0]]}
                    VALUES ((SELECT id FROM new_comp), 
                    %s, -- Tipo do componente
                    %s, -- Codigo do componente 
                    %s -- Encapsulamento
                    );
                """
            )

        with connection.cursor() as cursor:
            try:
                cursor.execute(sql_insertion, args)
                connection.commit()
                st.success("Componente adicionado com sucesso.")
            except Exception as e:
                connection.rollback()
                print(f"ERRO AO ADICIONAR COMPONENTE: {e}")
                st.error("Erro ao adicionar o componente.")

    col1, col2 = st.columns(2)
    with col1:
        disable_add = True
        st.subheader("Adicionar componente")
        category = st.radio(
            label="Selecione a categoria do componente: *",
            options=TABLE_NAMES.keys(),
            index=None,
        )

        with connection.cursor() as cursor:
            cursor.execute("SELECT supplier_name FROM suppliers")
            result = cursor.fetchall()
            suppliers = list()
            # FORMATANDO LISTA
            for item in result:
                suppliers.append(item[0])

        # ATRIBUTOS GERAIS
        quantity = st.number_input(
            "Digite a quantidade de componentes no estoque:", min_value=0
        )
        minimum_quantity = st.number_input(
            'Digite a quantidade para que o componente seja considerado em "baixa quantidade":',
            min_value=0,
        )
        manufacturer = st.text_input(
            "Digite o fabricante do componente:", max_chars=128
        )
        supplier = st.radio(
            label="Selecione o fornecedor do componente (Se for conhecido):",
            options=suppliers,
            index=None,
        )
        link_datasheet = st.text_input(
            "Insira o link do datasheet do componente (Se Houver):"
        )

        general_args = [
            category,
            quantity,
            minimum_quantity,
            None if not manufacturer else manufacturer,
            None if not supplier else supplier,
            None if not link_datasheet else link_datasheet,
        ]

        # ATRIBUTOS ESPECIFICOS DE CADA COMPONENTE
        specific_validation = False
        if category:
            encapsulation = st.text_input(
                f"Digite o encapsulamento do componente:", max_chars=32
            )

            if category == "Capacitor":
                capacitance = st.text_input(
                    "Digite a Capacitância (com unidade de medida): *", max_chars=32
                )
                max_voltage = st.text_input(
                    "Digite a tensão máxima suportada: *", max_chars=32
                )
                cap_type = st.text_input("Digite o tipo do capacitor:", max_chars=32)

                if capacitance and max_voltage:
                    specific_validation = True

                specific_args = [
                    capacitance,
                    max_voltage,
                    None if not cap_type else cap_type,
                    None if not encapsulation else encapsulation,
                ]
            else:
                comp_type = st.text_input(f"Digite o tipo do componente:", max_chars=32)
                comp_code = st.text_input(
                    f"Digite o código do componente", max_chars=32
                )

                specific_validation = True
                specific_args = [
                    None if not comp_type else comp_type,
                    None if not comp_code else comp_code,
                    None if not encapsulation else encapsulation,
                ]

            args = tuple(general_args + specific_args)

            if specific_validation and category:
                disable_add = False
            else:
                disable_add = True

        st.write("Todas as opções terminadas com * devem ser preenchidas/selecionadas.")

        yes_button = st.button(
            "Adicionar componente",
            type="primary",
            disabled=disable_add,
        )

        # DANDO TEMPO DO RERUN DA INTERFACE
        if yes_button:
            disable_add = True
            sleep(2)
            add_comp(args)
