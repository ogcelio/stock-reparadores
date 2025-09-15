from sys import argv, exit

from PySide6.QtWidgets import QApplication, QMainWindow


class login_screen(QMainWindow):
    def __init__(self):
        super().__init__()


if __name__ == "__main__":
    app = QApplication(argv)
    window = login_screen()
    window.showMaximized()
    exit(app.exec())
