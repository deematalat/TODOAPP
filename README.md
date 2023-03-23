 # Flutter Todo App
This is a Flutter Todo app that allows users to create and manage their to-do lists. The app utilizes sqflite for local database storage, Provider for state management, and clean architecture for code organization.
<img src="screenshots/todofram.png" alt="Alt text" title="Optional title">
# Features

Create, edit, and delete to-do items.
Mark items as completed or incomplete.
View completed and incomplete items separately.
Sort items by due date or priority.
Utilizes sqflite for local database storage.

# Installation

Clone the repository to your local machine.
Open the project in your preferred code editor.
Run flutter pub get to install the required packages.
Run flutter run to start the app on your emulator or device.
Dependencies
provider: ^6.0.0
sqflite: ^2.0.0+3
flutter_slidable: ^0.6.0
intl: ^0.17.0

# Clean Architecture
This app follows the principles of clean architecture to keep the code organized and maintainable. Clean architecture separates the app into three layers: domain, data, and presentation. The domain layer contains the business logic of the app, the data layer handles data storage and retrieval, and the presentation layer handles the user interface.

# Provider
This app uses the Provider package to manage state. Provider is a simple way to manage app state without using complex state management patterns like BLoC or Redux. The app uses Provider to manage the state of the to-do items, including creation, editing, and deletion.

# Sqflite
This app uses the sqflite package to store to-do items in a local SQLite database. Sqflite is a lightweight and efficient way to store structured data in Flutter apps.

# Conclusion
This Flutter Todo app demonstrates the use of clean architecture, sqflite, and Provider to create a clean, organized, and maintainable codebase. Feel free to modify and customize this app to fit your specific needs. Happy coding!
