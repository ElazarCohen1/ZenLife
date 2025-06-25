from spending import *


class Budget : 
    def __init__(self):
        self.spendings:Spending = []
        self.incomes:Income = []
        self.sum_income = 0
        self.sum_spending = 0

    def calculate_balance(self):
        return self.sum_income - self.sum_spending

    def display_spending(self):
        for i in self.spendings:
            print(i)

    def display_income(self):
        for i in self.incomes:
            print(i)

    def add_spending(self, spending: Spending):
        self.spendings.append(spending)
        self.sum_spending += spending.amount

    def add_income(self, income: Income):
        self.incomes.append(income)
        self.sum_income += income.amount

    def display_budget(self):
        balance = self.calculate_balance()
        print(f"vous avez un solde de : {balance:.2f} euros")
        print("vos depenses totales sont : ", self.sum_spending)
        print("vos revenus totaux sont : ", self.sum_income)
        print("vos depenses sont : ")
        self.display_spending()
        print("vos revenus sont : ")
        self.display_income()
