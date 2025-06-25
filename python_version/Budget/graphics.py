import tkinter as tk
from tkinter import messagebox
from budget import Budget
from spending import Spending, Income, Date
from backup import launch_backup

class BudgetApp:
    def __init__(self, root):
        self.budget = Budget()
        self.root = root
        self.root.title("Gestionnaire de Budget")

        tk.Label(root, text="Montant:").grid(row=0, column=0)
        tk.Label(root, text="Description:").grid(row=1, column=0)
        tk.Label(root, text="Date (dd/mm/yyyy):").grid(row=2, column=0)
        tk.Label(root, text="Catégorie (1-5 pour dépense):(essential,health,education,personal,other)").grid(row=3, column=0)

        self.amount_entry = tk.Entry(root)
        self.description_entry = tk.Entry(root)
        self.date_entry = tk.Entry(root)
        self.category_entry = tk.Entry(root)

        self.amount_entry.grid(row=0, column=1)
        self.description_entry.grid(row=1, column=1)
        self.date_entry.grid(row=2, column=1)
        self.category_entry.grid(row=3, column=1)

        tk.Button(root, text="Ajouter Revenu", command=self.add_income).grid(row=4, column=0, pady=10)
        tk.Button(root, text="Ajouter Dépense", command=self.add_spending).grid(row=4, column=1)
        tk.Button(root, text="Afficher Budget", command=self.display_budget).grid(row=5, column=0, columnspan=2)

        self.output = tk.Text(root, height=15, width=60)
        self.output.grid(row=6, column=0, columnspan=2, pady=10)

    def parse_date(self, date_str):
        try:
            day, month, year = map(int, date_str.split('/'))
            return Date(day, month, year)
        except:
            messagebox.showerror("Erreur", "Date invalide.")
            return None

    def add_income(self):
        date = self.parse_date(self.date_entry.get())
        if date:
            try:
                amount = float(self.amount_entry.get())
                desc = self.description_entry.get()
                income = Income(amount, 0, date, desc)
                self.budget.add_income(income)
                messagebox.showinfo("Succès", "Revenu ajouté.")
            except:
                messagebox.showerror("Erreur", "Montant invalide.")

    def add_spending(self):
        date = self.parse_date(self.date_entry.get())
        if date:
            try:
                amount = float(self.amount_entry.get())
                desc = self.description_entry.get()
                cat = int(self.category_entry.get())
                spending = Spending(amount, cat, date, desc)
                self.budget.add_spending(spending)
                messagebox.showinfo("Succès", "Dépense ajoutée.")
            except:
                messagebox.showerror("Erreur", "Entrée invalide.")

    def display_budget(self):
        self.output.delete("1.0", tk.END)
        balance = self.budget.calculate_balance()
        text = f"Solde: {balance:.2f}€\n"
        text += f"Revenus: {self.budget.sum_income:.2f}€\n"
        text += f"Dépenses: {self.budget.sum_spending:.2f}€\n\n"

        text += "Revenus:\n"
        for i in self.budget.incomes:
            text += f"  - {i}\n"
        text += "\nDépenses:\n"
        for i in self.budget.spendings:
            text += f"  - {i}\n"

        self.output.insert(tk.END, text)

def launch_gui():
    root = tk.Tk()
    app = BudgetApp(root)
    root.mainloop()
    # launch_backup(app.budget)
    
    
