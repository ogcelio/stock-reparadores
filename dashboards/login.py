import os
from platform import system
from sys import argv, exit

from PySide6.QtGui import QColor, QPainter, QPalette, QPixmap
from PySide6.QtWidgets import (
    QApplication,
    QFormLayout,
    QHBoxLayout,
    QLabel,
    QLineEdit,
    QMainWindow,
    QPushButton,
    QVBoxLayout,
    QWidget,
)

if system() == "Linux":
    background_path = "images/login_image.png"
elif system() == "Windows":
    background_path = "images\\login_image.png"


class LoginWidget(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setFixedSize(350, 280)
        self.setAutoFillBackground(True)
        palette = self.palette()
        palette.setColor(QPalette.ColorRole.Window, QColor("#f0f0f0"))
        self.setPalette(palette)
        self.setStyleSheet(
            """
            QLineEdit {
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 8px;
                font-size: 14px;
                color: white;
                min-height: 20px;
            }
            QPushButton {
                padding: 10px;
                border: none;
                border-radius: 8px;
                background-color: #18702D;
                color: white;
                font-size: 14px;
                font-weight: bold;
            }
            QPushButton:hover {
                text-decoration: underline;
                background-color: #154722;
            }
            QLabel {
                color: #333;
                font-size: 14px;
            }
        """
        )

        main_layout = QVBoxLayout(self)
        main_layout.setContentsMargins(30, 30, 30, 30)
        main_layout.setSpacing(20)

        form_layout = QFormLayout()
        form_layout.setSpacing(10)

        self.email_input = QLineEdit()
        self.email_input.setPlaceholderText("Insira o seu email")
        form_layout.addRow(QLabel("Email:"), self.email_input)

        self.password_input = QLineEdit()
        self.password_input.setPlaceholderText("Insira a sua senha")
        self.password_input.setEchoMode(QLineEdit.EchoMode.Password)
        form_layout.addRow(QLabel("Senha:"), self.password_input)

        main_layout.addLayout(form_layout)

        confirm_button = QPushButton("Confirmar")
        main_layout.addWidget(confirm_button)

        forgot_password_button = QPushButton("Esqueceu a senha?")
        forgot_password_button.setStyleSheet(
            """
            QPushButton {
                background-color: #18702D;
                color: #ffffff;
                text-align: right;
                font-size: 14px;
                font-weight: normal;
            }
            QPushButton:hover {
                text-decoration: underline;
                background-color: #154722;
            }
        """
        )
        register_button = QPushButton("Realizar Cadastro")
        register_button.setStyleSheet(
            """
            QPushButton {
                background-color: #18702D;
                color: #ffffff;
                text-align: left;
                font-size: 14px;
                font-weight: normal;
            }
            QPushButton:hover {
                text-decoration: underline;
                background-color: #154722;
            }
        """
        )
        h_layout = QHBoxLayout()
        h_layout.addStretch()
        h_layout.addWidget(register_button)
        h_layout.addWidget(forgot_password_button)
        main_layout.addLayout(h_layout)


class login_screen(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setAutoFillBackground(True)
        self.login_widget = LoginWidget(self)
        self.setWindowTitle("Bem-Vindo ao Stock-Reparadores!")

    def paintEvent(self, event):
        painter = QPainter(self)
        pixmap = QPixmap(os.path.join(os.path.dirname(__file__), background_path))
        painter.drawPixmap(self.rect(), pixmap)

    def resizeEvent(self, event):
        super().resizeEvent(event)
        # Center the login widget
        x = (self.width() - self.login_widget.width()) / 2
        y = (self.height() - self.login_widget.height()) / 2
        self.login_widget.move(int(x), int(y))
        self.login_widget.raise_()
        self.update()


if __name__ == "__main__":
    app = QApplication(argv)
    window = login_screen()
    window.showMaximized()
    exit(app.exec())
