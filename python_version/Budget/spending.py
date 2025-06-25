class Date:
    def __init__(self, day:int, month:int, year:int):
        self.day = day
        self.month = month
        self.year = year

    def __str__(self):
        return f"{self.day:02d}/{self.month:02d}/{self.year}"
    
    def __repr__(self):
        return f"Date({self.day}, {self.month}, {self.year})"

class Spending():
    def __init__(self, amount:float, category:int,date:Date,description:str):
        self.description = description
        self.date = date
        self.amount = amount
        self.category = category

    def __str__(self):
        return f"description: {self.description}, date: {self.date}, amount: {self.amount:.2f} euros"


class Income(Spending):
    def __init__(self, amount:float, category:int,date:Date,description:str):
        super().__init__(amount, category, date, description)
        self.category = 0  # Income category is always 0

    def __str__(self):
        return f"description: {self.description}, date: {self.date}, amount: {self.amount:.2f} euros"
     