import 'package:flutter/material.dart';
import '../services/hive_todo_service.dart';

class HiveTodoScreen extends StatefulWidget {
  const HiveTodoScreen({super.key});

  @override
  State<HiveTodoScreen> createState() => _HiveTodoScreenState();
}

class _HiveTodoScreenState extends State<HiveTodoScreen> {
  final TextEditingController taskController = TextEditingController();
  final HiveTodoService todoService = HiveTodoService();

  late List<String> tasks;

  @override
  void initState() {
    super.initState();
    tasks = todoService.getTasks();
  }

  void addTask() {
    if (taskController.text.trim().isEmpty) return;

    todoService.addTask(taskController.text.trim());

    setState(() {
      tasks = todoService.getTasks();
      taskController.clear();
    });
  }

  void deleteTask(int index) {
    todoService.deleteTask(index);

    setState(() {
      tasks = todoService.getTasks();
    });
  }

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Todo App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: taskController,
              decoration: const InputDecoration(
                labelText: 'Enter task',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: addTask,
              child: const Text('Add Task'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: tasks.isEmpty
                  ? const Center(
                child: Text('No tasks added yet'),
              )
                  : ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(tasks[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => deleteTask(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}