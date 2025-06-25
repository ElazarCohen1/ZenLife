# 🌿 ZenLife – Your Personal Assistant for a Balanced Life

**ZenLife** is a multi-platform life assistant app built with **Flutter (Dart)** for the frontend and **Python (Flask)** for the backend. It helps you organize your personal life — from **money management** and **meal planning** to **travel organization** and **daily well-being** — all in one clean, minimal app.

The goal? **Less stress, more clarity.**

---

## ✨ Features (MVP in Progress)

✅ = Completed 🛠️ = In Progress 🔜 = Coming Soon

### 🏠 Home Page
- ✅ Intro to the app
- ✅ Daily to-do or reflection space
- 🔜 Motivational quotes / tips

### 🔐 Authentication
- ✅ Login / Sign up system
- 🔜 Google or social login integration
- 🔜 Session-based login using local + backend checks

### 💰 Money Management
- ✅ Add incomes and expenses
- ✅ Basic balance tracking
- 🔜 Expense categories
- 🔜 Budget alerts or limits
- 🔜 Monthly summaries

### 🥗 Meal Suggestions
- 🛠️ Generate meal ideas based on budget
- 🔜 Link to local grocery list
- 🔜 Filter by diet (vegan, etc.)

### ✈️ Travel Organizer
- 🛠️ Plan trips
- 🔜 Budget estimation
- 🔜 Save favorite destinations
- 🔜 Packing checklist

### ⚙️ Settings
- ✅ Change themes / colors (soon)
- 🔜 Language and notification preferences

---

## 🗂️ Project Structure
zenlife/
├── flutter_version/ 
│ ├── ios/
│ ├── lib/
│ │ ├── main.dart # App entry point
│ │ └── screens/ # Pages (Home, Money, Meal, Travel, etc.)
│ │   └── accueil.dart
│ |   ├── add_remove_payement.dart
│ |   ├── connexion.dart
│ |   ├── mainscaffold.dart
│ |   ├── menu.dart
│ |   ├── money.dart
│ |   ├── my_meal.dart
│ |   ├── settings.dart
│ |   ├── travel.dart
│ │ └── models/
│ │   └── money.dart
│ └── pubspec.yaml # Flutter dependencies
│ ├── linux/
│ ├── macos/
│
├── python_version/ 
│
├── README.md
└── database/
├── local.db # SQLite (temporary local storage)
├── LICENSE
└── schema.sql # PostgreSQL structure for later deployment




---

## ⚙️ How to Run the App

### 🟪 Flutter (main frontend)

1. Install Flutter SDK: https://docs.flutter.dev/get-started
2. Navigate to the Flutter project folder:

```bash
cd flutter_version
flutter pub get
flutter run
```
## 🔒 Sécurité
- Hashage des mots de passe (bcrypt)

- Gestion des sessions

- Protection des routes sensibles

## Licence
Ce projet est sous licence MIT - voir le fichier [LICENSE](LICENSE) pour plus de détails.

## Auteurs
- [Cohen Elazar](https://github.com/ElazarCohen1)

