BEGIN;

-- 1. GARANTINDO QUE OS FORNECEDORES EXISTAM
INSERT INTO suppliers (supplier_name, phone, email, seller_phone)
VALUES 
('Mouser Electronics', '1199999999', 'sales@mouser.com', '1188888888'),
('DigiKey', '1177777777', 'contato@digikey.com', NULL),
('Loja Local de Eletrônica', '2125252525', 'balcao@lojalocal.com.br', '21999990000'),
('AliExpress Parts', NULL, 'seller@aliexpress.com', NULL)
ON CONFLICT (supplier_name) DO NOTHING;


------------------------------------------------------------------------------------
-- EXEMPLOS DO USUÁRIO
------------------------------------------------------------------------------------

-- Exemplo 1: Capacitor 1uF
-- !!! BAIXO ESTOQUE !!! (Tem 2, Mínimo é 5)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id, link_datasheet)
    VALUES (
        'Capacitor', 
        2, -- Qtd Atual
        5, -- Qtd Mínima
        NULL, 
        (SELECT id FROM suppliers WHERE supplier_name = 'Loja Local de Eletrônica'),
        NULL
    )
    RETURNING id
)
INSERT INTO capacitors (comp_id, capacitance, max_voltage, cap_type, encapsulation)
VALUES ((SELECT id FROM new_comp), '1uF', '100V', 'Eletrolítico', 'THP');

-- Exemplo 2: IC 24C01 (Estoque Normal)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id, link_datasheet)
    VALUES ('Circuito Integrado', 6, 3, NULL, (SELECT id FROM suppliers WHERE supplier_name = 'DigiKey'), 'https://www.alldatasheet.com/datasheet-pdf/download/56094/ATMEL/24C01.html')
    RETURNING id
) 
INSERT INTO integrated_circuits (comp_id, ic_type, ic_code, encapsulation) 
VALUES ((SELECT id FROM new_comp), 'EEPROM', '24C01', 'SOIC-8');

-- Exemplo 3: Memória 27C010 (Estoque Normal)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id, link_datasheet)
    VALUES ('Memória', 5, 1, NULL, (SELECT id FROM suppliers WHERE supplier_name = 'Mouser Electronics'), NULL)
    RETURNING id
) 
INSERT INTO memories (comp_id, mem_type, mem_code, encapsulation) 
VALUES ((SELECT id FROM new_comp), 'EPROM', '27C010', 'PLCC-32');


------------------------------------------------------------------------------------
-- CATEGORIA 1: CAPACITORES
------------------------------------------------------------------------------------

-- 1.1 Capacitor Cerâmico 22pF (Estoque Normal)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id)
    VALUES ('Capacitor', 50, 15, 'Yageo', (SELECT id FROM suppliers WHERE supplier_name = 'DigiKey'))
    RETURNING id
) INSERT INTO capacitors (comp_id, capacitance, max_voltage, cap_type, encapsulation)
VALUES ((SELECT id FROM new_comp), '22pF', '50V', 'Cerâmico', '0805');

-- 1.2 Capacitor Eletrolítico 1000uF
-- !!! BAIXO ESTOQUE !!! (Tem 3, Mínimo é 5)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id)
    VALUES ('Capacitor', 3, 5, 'Nichicon', (SELECT id FROM suppliers WHERE supplier_name = 'Mouser Electronics'))
    RETURNING id
) INSERT INTO capacitors (comp_id, capacitance, max_voltage, cap_type, encapsulation)
VALUES ((SELECT id FROM new_comp), '1000uF', '35V', 'Eletrolítico', 'THP');

-- 1.3 Capacitor de Poliéster 100nF (Estoque Normal)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id)
    VALUES ('Capacitor', 100, 30, NULL, (SELECT id FROM suppliers WHERE supplier_name = 'Loja Local de Eletrônica'))
    RETURNING id
) INSERT INTO capacitors (comp_id, capacitance, max_voltage, cap_type, encapsulation)
VALUES ((SELECT id FROM new_comp), '100nF', '100V', 'Poliéster', 'THP');

-- 1.4 Capacitor Tântalo 47uF
-- !!! ESTOQUE ZERO !!! (Acabou tudo, Mínimo é 5)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id)
    VALUES ('Capacitor', 0, 5, 'Kemet', (SELECT id FROM suppliers WHERE supplier_name = 'Mouser Electronics'))
    RETURNING id
) INSERT INTO capacitors (comp_id, capacitance, max_voltage, cap_type, encapsulation)
VALUES ((SELECT id FROM new_comp), '47uF', '16V', 'Tântalo', 'SMD Case C');

-- 1.5 Supercapacitor 1F (Estoque Limite - Igual ao mínimo, ainda ok)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id)
    VALUES ('Capacitor', 1, 1, 'Eaton', (SELECT id FROM suppliers WHERE supplier_name = 'DigiKey'))
    RETURNING id
) INSERT INTO capacitors (comp_id, capacitance, max_voltage, cap_type, encapsulation)
VALUES ((SELECT id FROM new_comp), '1F', '5.5V', 'Supercap', 'Coin Type');


------------------------------------------------------------------------------------
-- CATEGORIA 2: CIRCUITOS INTEGRADOS
------------------------------------------------------------------------------------

-- 2.1 Microcontrolador ATmega328P
-- !!! BAIXO ESTOQUE !!! (Tem 1, Mínimo é 3 - Crítico!)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id, link_datasheet)
    VALUES ('Circuito Integrado', 1, 3, 'Microchip', (SELECT id FROM suppliers WHERE supplier_name = 'Mouser Electronics'), 'https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7810-Automotive-Microcontrollers-ATmega328P_Datasheet.pdf')
    RETURNING id
) INSERT INTO integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'Microcontrolador', 'ATmega328P', 'DIP-28');

-- 2.2 Regulador Ajustável LM317 (Estoque Normal)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id)
    VALUES ('Circuito Integrado', 10, 4, 'Texas Instruments', (SELECT id FROM suppliers WHERE supplier_name = 'Loja Local de Eletrônica'))
    RETURNING id
) INSERT INTO integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'Regulador de Tensão', 'LM317', 'TO-220');

-- 2.3 Contador Década CD4017 (Estoque Normal)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id)
    VALUES ('Circuito Integrado', 15, 5, 'Texas Instruments', (SELECT id FROM suppliers WHERE supplier_name = 'DigiKey'))
    RETURNING id
) INSERT INTO integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'Contador CMOS', 'CD4017', 'DIP-16');

-- 2.4 Shift Register 74HC595
-- !!! BAIXO ESTOQUE !!! (Tem 5, Mínimo é 8)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id)
    VALUES ('Circuito Integrado', 5, 8, 'NXP', (SELECT id FROM suppliers WHERE supplier_name = 'AliExpress Parts'))
    RETURNING id
) INSERT INTO integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'Shift Register', '74HC595', 'SOIC-16');

-- 2.5 Amplificador Operacional Duplo TL072 (Estoque Normal)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id)
    VALUES ('Circuito Integrado', 8, 2, 'STMicroelectronics', (SELECT id FROM suppliers WHERE supplier_name = 'Loja Local de Eletrônica'))
    RETURNING id
) INSERT INTO integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'OpAmp JFET', 'TL072', 'DIP-8');

-- 2.6 Timer 555 (Estoque Normal)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id, link_datasheet)
    VALUES ('Circuito Integrado', 20, 10, 'Texas Instruments', (SELECT id FROM suppliers WHERE supplier_name = 'DigiKey'), 'https://www.ti.com/lit/ds/symlink/ne555.pdf')
    RETURNING id
) 
INSERT INTO integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'Timer', 'NE555', 'DIP-8');


------------------------------------------------------------------------------------
-- CATEGORIA 3: MEMÓRIAS
------------------------------------------------------------------------------------

-- 3.1 EEPROM I2C 32K
-- !!! BAIXO ESTOQUE !!! (Tem 2, Mínimo é 5)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id)
    VALUES ('Memória', 2, 5, 'Microchip', (SELECT id FROM suppliers WHERE supplier_name = 'Mouser Electronics'))
    RETURNING id
) INSERT INTO memories (comp_id, mem_type, mem_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'EEPROM I2C', '24LC32', 'SOIC-8');

-- 3.2 Flash SPI 128Mbit (Estoque Normal)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id)
    VALUES ('Memória', 5, 2, 'Winbond', (SELECT id FROM suppliers WHERE supplier_name = 'DigiKey'))
    RETURNING id
) INSERT INTO memories (comp_id, mem_type, mem_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'Flash SPI', 'W25Q128', 'WSON-8');

-- 3.3 SRAM Paralela (Estoque Normal)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id)
    VALUES ('Memória', 4, 1, 'Alliance Memory', (SELECT id FROM suppliers WHERE supplier_name = 'Mouser Electronics'))
    RETURNING id
) INSERT INTO memories (comp_id, mem_type, mem_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'SRAM', '62256', 'DIP-28');

-- 3.4 EEPROM Paralela
-- !!! ESTOQUE ZERO !!! (Tem 0, Mínimo é 1)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id)
    VALUES ('Memória', 0, 1, 'Atmel', (SELECT id FROM suppliers WHERE supplier_name = 'AliExpress Parts'))
    RETURNING id
) INSERT INTO memories (comp_id, mem_type, mem_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'EEPROM Paralela', 'AT28C64', 'PLCC-32');

-- 3.5 Serial Flash Pequena (Estoque Normal)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id)
    VALUES ('Memória', 20, 5, 'Macronix', (SELECT id FROM suppliers WHERE supplier_name = 'DigiKey'))
    RETURNING id
) INSERT INTO memories (comp_id, mem_type, mem_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'Flash SPI', 'MX25L3206', 'SOP-8');


------------------------------------------------------------------------------------
-- CATEGORIA 4: DRIVERS
------------------------------------------------------------------------------------

-- 4.1 Ponte H Dupla L298N
-- !!! BAIXO ESTOQUE !!! (Tem 1, Mínimo é 4)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id, link_datasheet)
    VALUES ('Driver', 1, 4, 'STMicroelectronics', (SELECT id FROM suppliers WHERE supplier_name = 'Loja Local de Eletrônica'), 'https://www.st.com/resource/en/datasheet/l298.pdf')
    RETURNING id
) INSERT INTO drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'Ponte H Dupla', 'L298N', 'Multiwatt15');

-- 4.2 Driver de Passo A4988 (Estoque Normal)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id)
    VALUES ('Driver', 10, 4, 'Allegro', (SELECT id FROM suppliers WHERE supplier_name = 'AliExpress Parts'))
    RETURNING id
) INSERT INTO drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'Stepper Driver', 'A4988', 'QFN-28');

-- 4.3 Transceptor RS232 MAX232 (Estoque Normal)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id)
    VALUES ('Driver', 15, 3, 'Texas Instruments', (SELECT id FROM suppliers WHERE supplier_name = 'Mouser Electronics'))
    RETURNING id
) INSERT INTO drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'RS232 Transceiver', 'MAX232', 'DIP-16');

-- 4.4 Darlington Array ULN2803
-- !!! BAIXO ESTOQUE !!! (Tem 2, Mínimo é 3)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id)
    VALUES ('Driver', 2, 3, 'Toshiba', (SELECT id FROM suppliers WHERE supplier_name = 'DigiKey'))
    RETURNING id
) INSERT INTO drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'Darlington Array', 'ULN2803', 'DIP-18');

-- 4.5 MOSFET Driver Low-Side (Estoque Normal)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id)
    VALUES ('Driver', 5, 2, 'Microchip', (SELECT id FROM suppliers WHERE supplier_name = 'Mouser Electronics'))
    RETURNING id
) INSERT INTO drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'MOSFET Driver', 'TC4420', 'SOIC-8');

-- 4.6 Driver L293D (Estoque Normal)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id, link_datasheet)
    VALUES ('Driver', 8, 3, 'STMicroelectronics', (SELECT id FROM suppliers WHERE supplier_name = 'Mouser Electronics'), 'https://www.st.com/resource/en/datasheet/l293d.pdf')
    RETURNING id
) 
INSERT INTO drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'Motor Driver', 'L293D', 'DIP-16');


------------------------------------------------------------------------------------
-- CATEGORIA 5: TRANSISTORES
------------------------------------------------------------------------------------

-- 5.1 MOSFET de Potência IRFZ44N (Estoque Normal)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id)
    VALUES ('Transistor', 20, 5, 'Infineon', (SELECT id FROM suppliers WHERE supplier_name = 'Loja Local de Eletrônica'))
    RETURNING id
) INSERT INTO transistors (comp_id, transistor_type, transistor_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'MOSFET N-CH', 'IRFZ44N', 'TO-220');

-- 5.2 Transistor BJT PNP BC557
-- !!! BAIXO ESTOQUE !!! (Item popular acabando - Tem 10, Mínimo 25)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id)
    VALUES ('Transistor', 10, 25, 'Fairchild', (SELECT id FROM suppliers WHERE supplier_name = 'Loja Local de Eletrônica'))
    RETURNING id
) INSERT INTO transistors (comp_id, transistor_type, transistor_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'BJT PNP', 'BC557', 'TO-92');

-- 5.3 Transistor de Sinal 2N2222 (Estoque Normal)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id)
    VALUES ('Transistor', 15, 5, 'STMicroelectronics', (SELECT id FROM suppliers WHERE supplier_name = 'DigiKey'))
    RETURNING id
) INSERT INTO transistors (comp_id, transistor_type, transistor_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'BJT NPN', '2N2222', 'TO-18');

-- 5.4 MOSFET de Sinal 2N7000 (Estoque Normal)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id)
    VALUES ('Transistor', 40, 10, 'Onsemi', (SELECT id FROM suppliers WHERE supplier_name = 'Mouser Electronics'))
    RETURNING id
) INSERT INTO transistors (comp_id, transistor_type, transistor_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'MOSFET N-CH', '2N7000', 'TO-92');

-- 5.5 Transistor Darlington de Potência TIP120
-- !!! ESTOQUE ZERO !!! (Tem 0, Mínimo é 3)
WITH new_comp AS (
    INSERT INTO components (category, quantity, minimum_quantity, manufacturer, supplier_id)
    VALUES ('Transistor', 0, 3, 'STMicroelectronics', (SELECT id FROM suppliers WHERE supplier_name = 'Loja Local de Eletrônica'))
    RETURNING id
) INSERT INTO transistors (comp_id, transistor_type, transistor_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'Darlington NPN', 'TIP120', 'TO-220');

COMMIT;