from budget import Budget
from spending import Spending, Date

class Backup:
    def __init__(self,backup_file:str):
        self.backup_file = backup_file
        
    def save_spending(self, spending: Spending):
        with open(self.backup_file, "a") as file:
            file.write(f"{spending.date},{spending.category},{spending.amount},{spending.description}\n")
    
    def save_budget(self, budget: Budget):
        for spending in budget.spendings:
            self.save_spending(spending)
        for income in budget.incomes:
            self.save_spending(income)



    def load_spending(self):
        b = Budget()
        try:
            with open(self.backup_file, 'r') as file:
                for line in file:
                    date_str, category, amount_str = line.strip().split(',')
                    date = Date.from_string(date_str)
                    amount = float(amount_str)
                    spending = Spending(date, category, amount)
                    b.add_spending(spending)
                return b
                
        except FileNotFoundError: 
            print("No backup file found.")


def launch_backup(budget: Budget):
    backup = Backup("sauvegarde.txt")
    backup.save_budget(budget)
    print("Backup completed successfully.")
        