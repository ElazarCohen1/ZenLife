# 🌿 ZenLife – Your Personal Assistant for a Balanced Life

**ZenLife** is a C-based (Python/Web coming soon) application designed to help you manage your everyday life — from your **budget** and **habits** to your **meals** and **mental well-being**. The goal? Less stress, more clarity. Simple, minimal, and actually useful.

---

## ✨ Features (MVP in progress)

✅ = completed – 🛠️ = in progress – 🔜 = coming soon

### 📊 Budget Management (current module)
- ✅ Add **income** and **expenses**
- ✅ Automatic saving to a `.txt` file
- ✅ Calculate current **balance**
- 🛠️ Auto-add monthly income
- 🔜 Expense **categories**
- 🔜 Monthly **summaries & statistics**

### 🧠 Mental Journal *(coming soon)*
- 🔜 One reflective question per day
- 🔜 Track your mood or mental state

### 🥗 Meal Planning *(coming soon)*
- 🔜 Weekly meal planning
- 🔜 Auto-generate grocery list

### 🔔 Simple Reminders *(coming soon)*
- 🔜 Notifications for medication, payments, etc.

---

## 📁 Project Structure
zenlife/
├── main.c
├── budget.c
├── budget.h
├── utils.c
├── utils.h
├── Makefile
├── data/
│ └── transactions.txt
└── README.md


---

## ⚙️ How to Compile

Make sure you have `clang` installed, then run:

```bash
make
./build/budgetwise
```
