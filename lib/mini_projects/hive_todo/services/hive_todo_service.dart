import 'package:hive/hive.dart';

class HiveTodoService {
  final Box todoBox = Hive.box('todoBox');

  List<String> getTasks() {
    return todoBox.get('tasks', defaultValue: []).cast<String>();
  }

  void addTask(String task) {
    final List<String> tasks = getTasks();
    tasks.add(task);
    todoBox.put('tasks', tasks);
  }

  void deleteTask(int index) {
    final List<String> tasks = getTasks();
    tasks.removeAt(index);
    todoBox.put('tasks', tasks);
  }

  void clearTasks() {
    todoBox.put('tasks', []);
  }
}


// Explain: HiveTodoService storage layer hai jo Hive box ke through CRUD operations perform karta hai.
//
// Box access
// final Box todoBox = Hive.box('todoBox');
//
// Meaning: Open already initialized Hive box access
//
// Ye wahi box hai jo main.dart me open hua tha:
//
// await Hive.openBox('todoBox');
//
// Read data: getTasks()
//
// Returns: List<String>
//
// Read: todoBox.get('tasks')
//
// Key: tasks
//
// Stored value: ["Learn Flutter", "Learn Provider"]
//
// defaultValue: defaultValue: []
//
// Agar pehli baar app open hui aur data nahi hai:
//
// Instead of crash: empty list
//
// cast<String>(): Hive generic dynamic return karta hai.
//
// Convert: dynamic → List<String>
// Create: addTask()
//
// Flow:
//
// read existing tasks
// ↓
// add new task
// ↓
// save updated list
//
// Delete: removeAt(index)
//
// Specific task remove.
//
// Update persistence: todoBox.put('tasks', tasks);
//
// Immediately local storage me save.
//
// App close hone ke baad bhi safe.