
# 📝 Flutter Task Manager App

A simple task management Flutter application with optional authentication, built with clean architecture principles, responsive UI, and state management using Provider or Riverpod.

---

## 📋 Features and Requirements

### 🔐 1. Authentication 

* Basic login screen with hardcoded credentials (`test@test.com` / `123456`)
* Displays error message for invalid credentials
* Redirects to Task List screen on successful login

### ✅ 2. Task List Screen

* Displays a list of tasks with:

  * **Title**
  * **Description**
  * **Due Date**
  * **Status** (Pending / Completed)
* Mock data stored locally (Hive)
* Each task card includes:

  * **Edit** button
  * **Delete** button
  * **Status** to toggle task status

### 📝 3. Add/Edit Task Screen

* Form to input:

  * **Title** (required)
  * **Description** (optional)
  * **Due Date** (Date Picker)
  * **Status** toggle (Pending / Completed)
* Save button with validation and task list update

### 🗂️ 4. State Management

* Uses **Provider** or **Riverpod** for state management and reactive UI updates

### 📱 5. Responsive UI

* Adapts to various screen sizes and devices
* Follows clean design with Material UI components

---

## 🚀 Getting Started

### Prerequisites

* Flutter SDK (latest stable version)
* Dart
* Android Studio or VS Code with Flutter plugin

### Installation

1. Clone the repository:

   ```bash
   git clone  https://github.com/Shaown292/binary_fusion_task.git
   cd flutter-task-manager
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app:

   ```bash
   flutter run
   ```

---

## 📦 Dependencies

* `flutter`
* `provider` 
* `hive` 


---



## 💡 Notes

* No backend integration; all data is stored locally
* Easy to extend with real backend services in the future
* Great for practice or use in interviews / Flutter learning projects

---



Let me know if you’d like this customized with your GitHub URL, screenshots, or specific packages you're using.
