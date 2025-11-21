BEGIN;

-- 1. GARANTINDO QUE OS FORNECEDORES EXISTAM
-- (O 'ON CONFLICT' evita erro se você rodar mais de uma vez, mas idealmente comece com tabelas limpas)
INSERT INTO suppliers (supplier_name, phone, email, seller_phone)
VALUES 
('Mouser Electronics', '1199999999', 'sales@mouser.com', '1188888888'),
('DigiKey', '1177777777', 'contato@digikey.com', NULL),
('Loja Local de Eletrônica', '2125252525', 'balcao@lojalocal.com.br', '21999990000'),
('AliExpress Parts', NULL, 'seller@aliexpress.com', NULL)
ON CONFLICT (supplier_name) DO NOTHING; 


------------------------------------------------------------------------------------
-- CATEGORIA 1: CAPACITORES (5 itens)
------------------------------------------------------------------------------------

-- 1.1 Capacitor Cerâmico 22pF
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Capacitor', 50, 'Yageo', (SELECT id FROM suppliers WHERE supplier_name = 'DigiKey'))
    RETURNING id
) INSERT INTO capacitors (comp_id, capacitance, max_voltage, cap_type, encapsulation)
VALUES ((SELECT id FROM new_comp), '22pF', '50V', 'Cerâmico', '0805');

-- 1.2 Capacitor Eletrolítico 1000uF
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Capacitor', 12, 'Nichicon', (SELECT id FROM suppliers WHERE supplier_name = 'Mouser Electronics'))
    RETURNING id
) INSERT INTO capacitors (comp_id, capacitance, max_voltage, cap_type, encapsulation)
VALUES ((SELECT id FROM new_comp), '1000uF', '35V', 'Eletrolítico', 'THP');

-- 1.3 Capacitor de Poliéster 100nF
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Capacitor', 100, NULL, (SELECT id FROM suppliers WHERE supplier_name = 'Loja Local de Eletrônica'))
    RETURNING id
) INSERT INTO capacitors (comp_id, capacitance, max_voltage, cap_type, encapsulation)
VALUES ((SELECT id FROM new_comp), '100nF', '100V', 'Poliéster', 'THP');

-- 1.4 Capacitor Tântalo 47uF
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Capacitor', 20, 'Kemet', (SELECT id FROM suppliers WHERE supplier_name = 'Mouser Electronics'))
    RETURNING id
) INSERT INTO capacitors (comp_id, capacitance, max_voltage, cap_type, encapsulation)
VALUES ((SELECT id FROM new_comp), '47uF', '16V', 'Tântalo', 'SMD Case C');

-- 1.5 Supercapacitor 1F
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Capacitor', 2, 'Eaton', (SELECT id FROM suppliers WHERE supplier_name = 'DigiKey'))
    RETURNING id
) INSERT INTO capacitors (comp_id, capacitance, max_voltage, cap_type, encapsulation)
VALUES ((SELECT id FROM new_comp), '1F', '5.5V', 'Supercap', 'Coin Type');


------------------------------------------------------------------------------------
-- CATEGORIA 2: CIRCUITOS INTEGRADOS (5 itens)
------------------------------------------------------------------------------------

-- 2.1 Microcontrolador ATmega328P
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Circuito Integrado', 5, 'Microchip', (SELECT id FROM suppliers WHERE supplier_name = 'Mouser Electronics'))
    RETURNING id
) INSERT INTO integrated_circuits (comp_id, ic_type, ic_code, encapsulation, link_datasheet)
VALUES ((SELECT id FROM new_comp), 'Microcontrolador', 'ATmega328P', 'DIP-28', 'https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7810-Automotive-Microcontrollers-ATmega328P_Datasheet.pdf');

-- 2.2 Regulador Ajustável LM317
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Circuito Integrado', 10, 'Texas Instruments', (SELECT id FROM suppliers WHERE supplier_name = 'Loja Local de Eletrônica'))
    RETURNING id
) INSERT INTO integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'Regulador de Tensão', 'LM317', 'TO-220');

-- 2.3 Contador Década CD4017
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Circuito Integrado', 15, 'Texas Instruments', (SELECT id FROM suppliers WHERE supplier_name = 'DigiKey'))
    RETURNING id
) INSERT INTO integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'Contador CMOS', 'CD4017', 'DIP-16');

-- 2.4 Shift Register 74HC595
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Circuito Integrado', 20, 'NXP', (SELECT id FROM suppliers WHERE supplier_name = 'AliExpress Parts'))
    RETURNING id
) INSERT INTO integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'Shift Register', '74HC595', 'SOIC-16');

-- 2.5 Amplificador Operacional Duplo TL072
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Circuito Integrado', 8, 'STMicroelectronics', (SELECT id FROM suppliers WHERE supplier_name = 'Loja Local de Eletrônica'))
    RETURNING id
) INSERT INTO integrated_circuits (comp_id, ic_type, ic_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'OpAmp JFET', 'TL072', 'DIP-8');


------------------------------------------------------------------------------------
-- CATEGORIA 3: MEMÓRIAS (5 itens)
------------------------------------------------------------------------------------

-- 3.1 EEPROM I2C 32K
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Memória', 10, 'Microchip', (SELECT id FROM suppliers WHERE supplier_name = 'Mouser Electronics'))
    RETURNING id
) INSERT INTO memories (comp_id, mem_type, mem_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'EEPROM I2C', '24LC32', 'SOIC-8');

-- 3.2 Flash SPI 128Mbit
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Memória', 5, 'Winbond', (SELECT id FROM suppliers WHERE supplier_name = 'DigiKey'))
    RETURNING id
) INSERT INTO memories (comp_id, mem_type, mem_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'Flash SPI', 'W25Q128', 'WSON-8');

-- 3.3 SRAM Paralela
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Memória', 4, 'Alliance Memory', (SELECT id FROM suppliers WHERE supplier_name = 'Mouser Electronics'))
    RETURNING id
) INSERT INTO memories (comp_id, mem_type, mem_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'SRAM', '62256', 'DIP-28');

-- 3.4 EEPROM Paralela
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Memória', 2, 'Atmel', (SELECT id FROM suppliers WHERE supplier_name = 'AliExpress Parts'))
    RETURNING id
) INSERT INTO memories (comp_id, mem_type, mem_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'EEPROM Paralela', 'AT28C64', 'PLCC-32');

-- 3.5 Serial Flash Pequena
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Memória', 20, 'Macronix', (SELECT id FROM suppliers WHERE supplier_name = 'DigiKey'))
    RETURNING id
) INSERT INTO memories (comp_id, mem_type, mem_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'Flash SPI', 'MX25L3206', 'SOP-8');


------------------------------------------------------------------------------------
-- CATEGORIA 4: DRIVERS
-- (Agora INCLUINDO a coluna encapsulation)
------------------------------------------------------------------------------------

-- 4.1 Ponte H Dupla L298N
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Driver', 6, 'STMicroelectronics', (SELECT id FROM suppliers WHERE supplier_name = 'Loja Local de Eletrônica'))
    RETURNING id
) INSERT INTO drivers (comp_id, driver_type, driver_code, encapsulation, link_datasheet)
VALUES ((SELECT id FROM new_comp), 'Ponte H Dupla', 'L298N', 'Multiwatt15', 'https://www.st.com/resource/en/datasheet/l298.pdf');

-- 4.2 Driver de Passo A4988
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Driver', 10, 'Allegro', (SELECT id FROM suppliers WHERE supplier_name = 'AliExpress Parts'))
    RETURNING id
) INSERT INTO drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'Stepper Driver', 'A4988', 'QFN-28');

-- 4.3 Transceptor RS232 MAX232
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Driver', 15, 'Texas Instruments', (SELECT id FROM suppliers WHERE supplier_name = 'Mouser Electronics'))
    RETURNING id
) INSERT INTO drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'RS232 Transceiver', 'MAX232', 'DIP-16');

-- 4.4 Darlington Array ULN2803
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Driver', 10, 'Toshiba', (SELECT id FROM suppliers WHERE supplier_name = 'DigiKey'))
    RETURNING id
) INSERT INTO drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'Darlington Array', 'ULN2803', 'DIP-18');

-- 4.5 MOSFET Driver Low-Side
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Driver', 5, 'Microchip', (SELECT id FROM suppliers WHERE supplier_name = 'Mouser Electronics'))
    RETURNING id
) INSERT INTO drivers (comp_id, driver_type, driver_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'MOSFET Driver', 'TC4420', 'SOIC-8');


------------------------------------------------------------------------------------
-- CATEGORIA 5: TRANSISTORES (5 itens)
------------------------------------------------------------------------------------

-- 5.1 MOSFET de Potência IRFZ44N
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Transistor', 20, 'Infineon', (SELECT id FROM suppliers WHERE supplier_name = 'Loja Local de Eletrônica'))
    RETURNING id
) INSERT INTO transistors (comp_id, transistor_type, transistor_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'MOSFET N-CH', 'IRFZ44N', 'TO-220');

-- 5.2 Transistor BJT PNP BC557
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Transistor', 50, 'Fairchild', (SELECT id FROM suppliers WHERE supplier_name = 'Loja Local de Eletrônica'))
    RETURNING id
) INSERT INTO transistors (comp_id, transistor_type, transistor_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'BJT PNP', 'BC557', 'TO-92');

-- 5.3 Transistor de Sinal 2N2222
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Transistor', 15, 'STMicroelectronics', (SELECT id FROM suppliers WHERE supplier_name = 'DigiKey'))
    RETURNING id
) INSERT INTO transistors (comp_id, transistor_type, transistor_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'BJT NPN', '2N2222', 'TO-18');

-- 5.4 MOSFET de Sinal 2N7000
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Transistor', 40, 'Onsemi', (SELECT id FROM suppliers WHERE supplier_name = 'Mouser Electronics'))
    RETURNING id
) INSERT INTO transistors (comp_id, transistor_type, transistor_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'MOSFET N-CH', '2N7000', 'TO-92');

-- 5.5 Transistor Darlington de Potência TIP120
WITH new_comp AS (
    INSERT INTO components (category, quantity, manufacturer, supplier_id)
    VALUES ('Transistor', 10, 'STMicroelectronics', (SELECT id FROM suppliers WHERE supplier_name = 'Loja Local de Eletrônica'))
    RETURNING id
) INSERT INTO transistors (comp_id, transistor_type, transistor_code, encapsulation)
VALUES ((SELECT id FROM new_comp), 'Darlington NPN', 'TIP120', 'TO-220');

COMMIT;