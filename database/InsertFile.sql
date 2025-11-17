-- Inicia uma transação. Se algo falhar, nada será salvo.
BEGIN;

-- =============================================
-- GRUPO: Capacitor eletrolítico THP
-- =============================================
WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 5) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '1uF',
        '100V',
        'Eletrolítico',
        'THP'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 5) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '2.2uF',
        '63V',
        'Eletrolítico',
        'THP'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 5) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '4.7uF',
        '100V',
        'Eletrolítico',
        'THP'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 5) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '10uF',
        '50V',
        'Eletrolítico',
        'THP'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 5) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '22uF',
        '50V',
        'Eletrolítico',
        'THP'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 4) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '47uF',
        '50V',
        'Eletrolítico',
        'THP'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 5) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '100uF',
        '25V',
        'Eletrolítico',
        'THP'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 6) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '220uF',
        '16V',
        'Eletrolítico',
        'THP'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 7) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '220uF',
        '50V',
        'Eletrolítico',
        'THP'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 2) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '470uF',
        '25V',
        'Eletrolítico',
        'THP'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 7) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '470uF',
        '50V',
        'Eletrolítico',
        'THP'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 4) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '1000uF',
        '25V',
        'Eletrolítico',
        'THP'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 4) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '1000uF',
        '50V',
        'Eletrolítico',
        'THP'
    );

-- =============================================
-- GRUPO: Capacitor eletrolítico SMD
-- =============================================
WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 2) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '4.7uF',
        '50V',
        'Eletrolítico',
        'SMD'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 8) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '4.7uF',
        '100V',
        'Eletrolítico',
        'SMD'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 5) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '22uF',
        '35V',
        'Eletrolítico',
        'SMD'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 5) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '22uF',
        '50V',
        'Eletrolítico',
        'SMD'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 10) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '47uF',
        '16V',
        'Eletrolítico',
        'SMD'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 4) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '47uF',
        '50V',
        'Eletrolítico',
        'SMD'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 1) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '100uF',
        '35V',
        'Eletrolítico',
        'SMD'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 0) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '100uF',
        '63V',
        'Eletrolítico',
        'SMD'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 15) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '220uF',
        '35V',
        'Eletrolítico',
        'SMD'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 3) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '220uF',
        '50V',
        'Eletrolítico',
        'SMD'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 1) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '470uF',
        '50V',
        'Eletrolítico',
        'SMD'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 4) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '1000uF',
        '25V',
        'Eletrolítico',
        'SMD'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 7) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '1000uF',
        '63V',
        'Eletrolítico',
        'SMD'
    );

-- =============================================
-- GRUPO: Capacitores de Tântalo
-- Nota: Pesquisei o código '226' (22uF), '336' (33uF) e '475' (4.7uF). Tensão de 10V é comum para '226'.
-- =============================================
WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 5) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '22uF',
        '10V',
        'Tântalo',
        'menor'
    );

-- 226 = 22uF
WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 4) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '22uF',
        '10V',
        'Tântalo',
        'maior'
    );

-- 226 = 22uF
WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 3) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '33uF',
        'N/A',
        'Tântalo',
        NULL
    );

-- 336 = 33uF
WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Capacitor', 3) RETURNING id
    )
INSERT INTO
    capacitor_specs (
        comp_id,
        capacitance,
        max_voltage,
        cap_type,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        '4.7uF',
        'N/A',
        'Tântalo',
        NULL
    );

-- 475 = 4.7uF
-- =============================================
-- GRUPO: SOIC8
-- Nota: Mapeados para 'Memória' (EEPROM) ou 'Circuito Integrado' (Outros)
-- =============================================
-- Memorias EEPROM (24C, 93C, 95X)
WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Memória', 6) RETURNING id
    )
INSERT INTO
    memories (comp_id, mem_type, mem_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'EEPROM',
        '24C01',
        'SOIC8'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Memória', 5) RETURNING id
    )
INSERT INTO
    memories (comp_id, mem_type, mem_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'EEPROM',
        '24C02',
        'SOIC8'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Memória', 4) RETURNING id
    )
INSERT INTO
    memories (comp_id, mem_type, mem_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'EEPROM',
        '24C04',
        'SOIC8'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Memória', 5) RETURNING id
    )
INSERT INTO
    memories (comp_id, mem_type, mem_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'EEPROM',
        '24C08',
        'SOIC8'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Memória', 5) RETURNING id
    )
INSERT INTO
    memories (comp_id, mem_type, mem_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'EEPROM',
        '24C16',
        'SOIC8'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Memória', 5) RETURNING id
    )
INSERT INTO
    memories (comp_id, mem_type, mem_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'EEPROM',
        '24C32',
        'SOIC8'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Memória', 3) RETURNING id
    )
INSERT INTO
    memories (comp_id, mem_type, mem_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'EEPROM',
        '93C46',
        'SOIC8'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Memória', 2) RETURNING id
    )
INSERT INTO
    memories (comp_id, mem_type, mem_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'EEPROM',
        '93C56',
        'SOIC8'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Memória', 4) RETURNING id
    )
INSERT INTO
    memories (comp_id, mem_type, mem_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'EEPROM',
        '93C66',
        'SOIC8'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Memória', 4) RETURNING id
    )
INSERT INTO
    memories (comp_id, mem_type, mem_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'EEPROM',
        '93C86',
        'SOIC8'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Memória', 5) RETURNING id
    )
INSERT INTO
    memories (comp_id, mem_type, mem_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'EEPROM',
        '95040',
        'SOIC8'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Memória', 4) RETURNING id
    )
INSERT INTO
    memories (comp_id, mem_type, mem_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'EEPROM',
        '95080',
        'SOIC8'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Memória', 4) RETURNING id
    )
INSERT INTO
    memories (comp_id, mem_type, mem_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'EEPROM',
        '95160',
        'SOIC8'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Memória', 3) RETURNING id
    )
INSERT INTO
    memories (comp_id, mem_type, mem_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'EEPROM',
        '95320',
        'SOIC8'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Memória', 2) RETURNING id
    )
INSERT INTO
    memories (comp_id, mem_type, mem_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'EEPROM',
        '95640',
        'SOIC8'
    );

-- Circuitos Integrados (SOIC8)
WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Circuito Integrado', 2) RETURNING id
    )
INSERT INTO
    integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Comunicador CAN',
        'A82C250Y',
        'SOIC8'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Circuito Integrado', 1) RETURNING id
    )
INSERT INTO
    integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'N/I',
        '9241AEY',
        'SOIC8'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Circuito Integrado', 1) RETURNING id
    )
INSERT INTO
    integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Amplificador',
        'AD8200YR',
        'SOIC8'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Circuito Integrado', 1) RETURNING id
    )
INSERT INTO
    integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Comunicador CAN',
        'TLE6250G',
        'SOIC8'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Circuito Integrado', 2) RETURNING id
    )
INSERT INTO
    integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'N/I',
        '35P08',
        'SOIC8'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Circuito Integrado', 3) RETURNING id
    )
INSERT INTO
    integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Comparador',
        'L2903',
        'SOIC8'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Circuito Integrado', 3) RETURNING id
    )
INSERT INTO
    integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Amplificador Op.',
        'L2904',
        'SOIC8'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Circuito Integrado', 1) RETURNING id
    )
INSERT INTO
    integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Driver',
        'L9170',
        'SOIC8'
    );

-- L9170 também listado em Drivers
-- =============================================
-- GRUPO: SOIC14
-- =============================================
WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Circuito Integrado', 4) RETURNING id
    )
INSERT INTO
    integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Comparador',
        'LM2901',
        'SOIC14'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Circuito Integrado', 2) RETURNING id
    )
INSERT INTO
    integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Amplificador Op.',
        'LM2902',
        'SOIC14'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Circuito Integrado', 1) RETURNING id
    )
INSERT INTO
    integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Comunicador CAN',
        'TLE6251',
        'SOIC14'
    );

-- =============================================
-- GRUPO: Memória DIP
-- =============================================
WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Memória', 2) RETURNING id
    )
INSERT INTO
    memories (comp_id, mem_type, mem_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'EPROM',
        '27C256',
        'DIP'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Memória', 3) RETURNING id
    )
INSERT INTO
    memories (comp_id, mem_type, mem_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'EPROM',
        '27C512',
        'DIP'
    );

-- =============================================
-- GRUPO: Memória PLCC
-- Nota: Quantidade não informada, assumindo 0 (DEFAULT).
-- =============================================
WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Memória', 0) RETURNING id
    )
INSERT INTO
    memories (comp_id, mem_type, mem_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'EPROM',
        '27C010',
        'PLCC'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Memória', 0) RETURNING id
    )
INSERT INTO
    memories (comp_id, mem_type, mem_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'EPROM',
        '27C512',
        'PLCC'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Memória', 0) RETURNING id
    )
INSERT INTO
    memories (comp_id, mem_type, mem_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'FLASH',
        '28F010',
        'PLCC'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Memória', 0) RETURNING id
    )
INSERT INTO
    memories (comp_id, mem_type, mem_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'FLASH',
        '28F512',
        'PLCC'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Memória', 0) RETURNING id
    )
INSERT INTO
    memories (comp_id, mem_type, mem_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'FLASH',
        '29F010',
        'PLCC'
    );

-- =============================================
-- GRUPO: Memória PSOP
-- =============================================
WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Memória', 0) RETURNING id
    )
INSERT INTO
    memories (comp_id, mem_type, mem_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'FLASH',
        '29F200',
        'PSOP'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Memória', 1) RETURNING id
    )
INSERT INTO
    memories (comp_id, mem_type, mem_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'FLASH',
        '29F400',
        'PSOP'
    );

-- =============================================
-- GRUPO: Chip de chave
-- Nota: Mapeado para 'Circuitos Integrados'
-- =============================================
WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Circuito Integrado', 2) RETURNING id
    )
INSERT INTO
    integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Chip de Chave',
        'T19',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Circuito Integrado', 2) RETURNING id
    )
INSERT INTO
    integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Chip de Chave',
        'T42',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Circuito Integrado', 2) RETURNING id
    )
INSERT INTO
    integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Chip de Chave',
        'T44',
        NULL
    );

-- =============================================
-- GRUPO: Drivers e outros componentes
-- Nota: Mapeados para 'Drivers', 'Transistors' ou 'Circuitos Integrados'
-- =============================================
-- Drivers (L9xxx)
WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 2) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        'L9104',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 2) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        'L9110',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 2) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        'L9113',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 3) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        'L9122',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 0) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        'L9131',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 0) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        'L9132',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 0) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        'L9134',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 1) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        'L9135',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 2) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        'L9147',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 2) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        'L9150',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 2) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        'L9170',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 1) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        'L9939',
        NULL
    );

-- Drivers (TLExxxx)
WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 1) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        'TLE4216',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 2) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Regulador',
        'TLE4298',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 1) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Motor',
        'TLE6209',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 1) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        'TLE6232',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 1) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Motor',
        'TLE7209',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 1) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Motor',
        'TLE8209',
        NULL
    );

-- Drivers (BTSxxxx - Chaves Inteligentes)
WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 1) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Chave',
        'BTS721L1',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 1) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Chave',
        'BTS724',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 0) -- Quantidade 'q' inválida, assumindo 0
            RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Chave',
        'BTS740S2',
        NULL
    );

-- Drivers (VBxxxx - Ignição)
WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 4) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Ignição',
        'VB025',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 4) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Ignição',
        'VB027',
        'THP'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 4) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Ignição',
        'VB027',
        'SMD'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 4) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Ignição',
        'VB325',
        NULL
    );

-- Transistores
WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Transistor', 5) RETURNING id
    )
INSERT INTO
    transistors (
        comp_id,
        transistor_type,
        transistor_code,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'MOSFET',
        '2N06CL',
        'THP'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Transistor', 3) RETURNING id
    )
INSERT INTO
    transistors (
        comp_id,
        transistor_type,
        transistor_code,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'MOSFET',
        '2N06CL',
        'SMD'
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Transistor', 1) RETURNING id
    )
INSERT INTO
    transistors (
        comp_id,
        transistor_type,
        transistor_code,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'MOSFET',
        'BUK9219',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Transistor', 1) RETURNING id
    )
INSERT INTO
    transistors (
        comp_id,
        transistor_type,
        transistor_code,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'MOSFET',
        'BUK9508',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Transistor', 1) RETURNING id
    )
INSERT INTO
    transistors (
        comp_id,
        transistor_type,
        transistor_code,
        encapsulation
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'IGBT',
        'MGP20N40CL',
        NULL
    );

-- Outros CIs e Drivers Automotivos (30xxx, 40xxx, etc)
WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Circuito Integrado', 1) RETURNING id
    )
INSERT INTO
    integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        '16250829',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Circuito Integrado', 4) RETURNING id
    )
INSERT INTO
    integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        '07096',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Circuito Integrado', 5) RETURNING id
    )
INSERT INTO
    integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        '8201AG',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Circuito Integrado', 3) RETURNING id
    )
INSERT INTO
    integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        'MAR9109PD',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Circuito Integrado', 2) RETURNING id
    )
INSERT INTO
    integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        '94084FB',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Circuito Integrado', 1) RETURNING id
    )
INSERT INTO
    integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        '4921_2MAL',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Circuito Integrado', 1) RETURNING id
    )
INSERT INTO
    integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        'APIC S03',
        NULL
    );

-- Lista de Drivers de ECU (3xxxx, 4xxxx)
WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 1) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Injeção/Ignição',
        '30637',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 2) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        '39639',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 3) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        '30358',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 3) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        '30621',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 1) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        '30397',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 2) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        '30313',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 2) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        '30054',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 1) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        '30615',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 1) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        '30536',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 1) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        '30221',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 1) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        '30421',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 1) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        '30402',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 1) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        '30572',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 1) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        '30348',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 1) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        '30520',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 1) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        '30619',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 1) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        '30403',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 1) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        '30682',
        NULL
    );

WITH
    new_comp AS (
        INSERT INTO
            components (category, quantity)
        VALUES
            ('Driver', 1) RETURNING id
    )
INSERT INTO
    drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES
    (
        (
            SELECT
                id
            FROM
                new_comp
        ),
        'Automotivo',
        '40004',
        NULL
    );

-- Confirma a transação
COMMIT;