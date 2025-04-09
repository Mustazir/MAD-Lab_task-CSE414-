# To-Do List App

A simple To-Do List app built using Flutter that allows users to manage their tasks efficiently. Users can add, mark as completed, and remove tasks dynamically.

## Features
- **Add Tasks**: Enter new tasks using a TextField and add them with a button.
- **Mark as Completed**: Mark tasks as completed using a checkbox.
- **Remove Tasks**: Delete tasks using a delete button.
- **Real-time Updates**: UI updates dynamically with `setState`.
- **Input Validation**: Prevent adding empty tasks.
- **User-Friendly Design**: Basic styling for an intuitive user experience.

## Screenshots
![App Screenshot Placeholder](https://via.placeholder.com/800x400?text=Add+Screenshots+Here)

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo-url/todo-list-app.git
   ```
2. Navigate to the project directory:
   ```bash
   cd todo-list-app
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Requirements
- Flutter SDK
- Dart SDK

## Code Highlights
### Adding a Task
```dart
void _addTask() {
  if (_taskController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Task cannot be empty.')),
    );
    return;
  }
  setState(() {
    _tasks.add({
      'title': _taskController.text,
      'isCompleted': false,
    });
    _taskController.clear();
  });
}
```

### Removing a Task
```dart
void _removeTask(int index) {
  setState(() {
    _tasks.removeAt(index);
  });
}
```

### Marking a Task as Completed
```dart
void _toggleTaskCompletion(int index) {
  setState(() {
    _tasks[index]['isCompleted'] = !_tasks[index]['isCompleted'];
  });
}
```

## Contributing
Feel free to fork this repository and submit pull requests. Contributions are always welcome!

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
