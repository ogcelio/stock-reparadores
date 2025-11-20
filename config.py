from os.path import dirname, join, abspath
from os import getcwd

try:
    # Desktop convencional
    SCRIPT_DIR = dirname(abspath(__file__))
except NameError:
    # Notebook (nao define __file__)
    SCRIPT_DIR = getcwd()

BACKGROUND_PATH = join(SCRIPT_DIR, "images", "background.png")
DATA_PATH = join(SCRIPT_DIR, ".cache", "temp.toml")
