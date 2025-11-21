-- TABELA DE USUÁRIOS
CREATE TABLE
  users (
    email VARCHAR(128) PRIMARY KEY,
    hash_psswd VARCHAR(255) NOT NULL,
    username VARCHAR(128) NOT NULL,
    phone VARCHAR(11) UNIQUE,
    user_role VARCHAR(32) NOT NULL
  );

-- TABELA DE FORNECEDORES
CREATE TABLE
  suppliers (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    supplier_name VARCHAR(128) NOT NULL UNIQUE,
    phone VARCHAR(11),
    email VARCHAR(128),
    seller_phone VARCHAR(11)
  );

-- TABELA DE COMPONENTES
CREATE TABLE
  components (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    category VARCHAR(32) NOT NULL,
    manufacturer VARCHAR(128),
    quantity INT NOT NULL DEFAULT 0 CHECK (quantity >= 0),
    supplier_id BIGINT, -- Pode ser NULL se não souber a origem
    CONSTRAINT fk_supplier FOREIGN KEY (supplier_id) REFERENCES suppliers (id) ON DELETE SET NULL -- Se apagar o fornecedor, o estoque fica 'sem fornecedor'
  );

-- TABELA DE CAPACITORES
CREATE TABLE
  capacitors (
    comp_id BIGINT PRIMARY KEY, -- ID DO COMPONENTE
    capacitance VARCHAR(32) NOT NULL, -- MICRO FARADAY
    max_voltage VARCHAR(32) NOT NULL, -- VOLTS
    cap_type VARCHAR(32),
    encapsulation VARCHAR(32),
    CONSTRAINT fk_comp_id FOREIGN KEY (comp_id) REFERENCES components (id) ON DELETE CASCADE -- SE APAGAR A COMPONENTES, CAPACITORES SAO APAGADOS 
  );

-- TABELA DE CIRCUITOS INTEGRADOS
CREATE TABLE
  integrated_circuits (
    comp_id BIGINT PRIMARY KEY,
    ic_type VARCHAR(32),
    ic_code VARCHAR(32),
    encapsulation VARCHAR(32),
    link_datasheet TEXT,
    CONSTRAINT fk_comp_id FOREIGN KEY (comp_id) REFERENCES components (id) ON DELETE CASCADE -- SE APAGAR A COMPONENTES, CIRCUITOS INTEGRADOS SAO APAGADOS 
  );

-- TABELA DE MEMÓRIAS
CREATE TABLE
  memories (
    comp_id BIGINT PRIMARY KEY,
    mem_type VARCHAR(32),
    mem_code VARCHAR(32),
    encapsulation VARCHAR(32),
    link_datasheet TEXT,
    CONSTRAINT fk_comp_id FOREIGN KEY (comp_id) REFERENCES components (id) ON DELETE CASCADE -- SE APAGAR A COMPONENTES, MEMORIAS SAO APAGADAS 
  );

-- TABELA DE DRIVERS
CREATE TABLE
  drivers (
    comp_id BIGINT PRIMARY KEY,
    driver_type VARCHAR(32),
    driver_code VARCHAR(32),
    encapsulation VARCHAR(32),
    link_datasheet TEXT,
    CONSTRAINT fk_comp_id FOREIGN KEY (comp_id) REFERENCES components (id) ON DELETE CASCADE -- SE APAGAR A COMPONENTES, MEMORIAS SAO APAGADAS 
  );

-- TABELA DE TRANSISTORES
CREATE TABLE
  transistors (
    comp_id BIGINT PRIMARY KEY,
    transistor_type VARCHAR(32),
    transistor_code VARCHAR(32),
    encapsulation VARCHAR(32),
    CONSTRAINT fk_comp_id FOREIGN KEY (comp_id) REFERENCES components (id) ON DELETE CASCADE -- SE APAGAR A COMPONENTES, MEMORIAS SAO APAGADAS 
  );

ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;

ALTER TABLE public.suppliers ENABLE ROW LEVEL SECURITY;

ALTER TABLE public.components ENABLE ROW LEVEL SECURITY;

ALTER TABLE public.capacitors ENABLE ROW LEVEL SECURITY;

ALTER TABLE public.integrated_circuits ENABLE ROW LEVEL SECURITY;

ALTER TABLE public.memories ENABLE ROW LEVEL SECURITY;

ALTER TABLE public.drivers ENABLE ROW LEVEL SECURITY;

ALTER TABLE public.transistors ENABLE ROW LEVEL SECURITY;