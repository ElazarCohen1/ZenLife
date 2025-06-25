from budget import Budget
from spending import Spending, Income, Date
from backup import launch_backup

class Menu:
    def __init__(self):
        self.budget = Budget()

    def display_menu(self):
        print("1. Ajouter Revenu")
        print("2. Ajouter Dépense")
        print("3. Afficher Budget")
        print("4. Quitter")

    def run(self):
        while True:
            self.display_menu()
            choice = input("Choix: ")
            if choice == '1':
                amount = float(input("Montant: "))
                description = input("Description: ")
                d = input("Date (jj/mm/aaaa): ")
                date = Date(*map(int, d.split('/')))
                self.budget.add_income(Income(amount, 0, date, description))
            elif choice == '2':
                amount = float(input("Montant: "))
                description = input("Description: ")
                d = input("Date (jj/mm/aaaa): ")
                date = Date(*map(int, d.split('/')))
                category = int(input("Catégorie (1-5): (essential,health,education,personal,other)\n"))
                self.budget.add_spending(Spending(amount, category, date, description))
            elif choice == '3':
                self.budget.display_budget()
            elif choice == '4':
                print("Au revoir !")
                launch_backup(self.budget)
                self.budget.display_budget()
                break
            else:
                print("Choix invalide.")

def launch_terminal():
    Menu().run()
