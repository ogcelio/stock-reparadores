class Componente:
    def __init__(self, quantity):
        self.quantidade: int = quantity


class Capacitor(Componente):
    def __init__(self, type, quantity, capacitance, voltage):
        super().__init__(quantity)
        self.type: str = type
        self.capacitance: int = capacitance  # micro Faraday
        self.voltage: int = voltage  # volts


class Drivers(Componente):
    def __init__(self, type, quantity):
        super().__init__(quantity)
        self.type: str = type


capacitor1 = Capacitor(type="Eletrolitico SMD", quantity=2, capacitance=4.7, voltage=50)

print(f"Capacitancia: {capacitor1.capacitance}")
