import sys
from graphics import launch_gui
from menu import launch_terminal
from backup import Backup

def main():
    print("Bienvenue dans le gestionnaire de budget.")
    print("1. Interface graphique")
    print("2. Interface terminal")
    choice = input("Choisis l'interface (1/2): ")
    if choice == '1':
        launch_gui()
    elif choice == '2':
        launch_terminal()
    else:
        print("Choix invalide.")
    


    

if __name__ == "__main__":
    main()
