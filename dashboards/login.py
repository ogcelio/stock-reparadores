import os
from platform import system
from sys import argv, exit

from PySide6.QtGui import QPainter, QPixmap
from PySide6.QtWidgets import QApplication, QMainWindow

if system() == "Linux":
    background_path = "images/login_image"
elif system() == "Windows":
    background_path = "images\\login_image"


class login_screen(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setAutoFillBackground(True)

    def paintEvent(self, event):
        painter = QPainter(self)
        pixmap = QPixmap(os.path.join(os.path.dirname(__file__), background_path))
        painter.drawPixmap(self.rect(), pixmap)

    def resizeEvent(self, event):
        self.update()
        super().resizeEvent(event)


if __name__ == "__main__":
    app = QApplication(argv)
    window = login_screen()
    window.showMaximized()
    exit(app.exec())
