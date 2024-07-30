# employee_management_dashboard

This project is a web-based Employee Management Dashboard built using Flutter and GetX for state management. It includes features for employee CRUD (Create, Read, Update, Delete) operations using a REST API and Firebase for authentication.

Features
User Authentication using Firebase
Create, Read, Update, and Delete Employees
Search Employees by ID
Responsive design for different screen sizes
Error handling and feedback using GetX


Setup Instructions
Prerequisites
Flutter SDK (>=2.0.0)
Firebase account
REST API for employee management


Clone the Repository:********

install dependencies /(flutter pub get)

dependencies:
  flutter:
    sdk: flutter
  get
  firebase_core
  firebase_auth
  http
  flutter_localizations:
    sdk: flutter

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner

Usage Instructions
Authentication
Login: Users can log in using their email and password.
Signup: New users can create an account.
Logout: Users can log out from the application.
Employee Management
View Employees: The home page displays a list of all employees.
Search Employees: Use the search icon in the app bar to search for an employee by ID.
Add Employee: Click the "+" button to navigate to the create employee page.
Update Employee: Click the edit icon on an employee card to update their details.
Delete Employee: Click the delete icon on an employee card to remove them.


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
