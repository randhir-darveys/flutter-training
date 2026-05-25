import 'package:flutter/material.dart';
import '../models/note_model.dart';
import '../services/database_helper.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<NoteModel> notes = [];
  NoteModel? editingNote;

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  Future<void> loadNotes() async {
    final data = await DatabaseHelper.instance.getNotes();

    setState(() {
      notes = data;
    });
  }

  Future<void> saveNote() async {
    if (titleController.text.trim().isEmpty ||
        descriptionController.text.trim().isEmpty) {
      return;
    }

    if (editingNote == null) {
      await DatabaseHelper.instance.insertNote(
        NoteModel(
          title: titleController.text.trim(),
          description: descriptionController.text.trim(),
        ),
      );
    } else {
      await DatabaseHelper.instance.updateNote(
        NoteModel(
          id: editingNote!.id,
          title: titleController.text.trim(),
          description: descriptionController.text.trim(),
        ),
      );
    }

    titleController.clear();
    descriptionController.clear();
    editingNote = null;

    loadNotes();
  }

  Future<void> deleteNote(int id) async {
    await DatabaseHelper.instance.deleteNote(id);
    loadNotes();
  }

  void editNote(NoteModel note) {
    titleController.text = note.title;
    descriptionController.text = note.description;

    setState(() {
      editingNote = note;
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('sqflite Notes App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: saveNote,
              child: Text(
                editingNote == null ? 'Add Note' : 'Update Note',
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: notes.isEmpty
                  ? const Center(
                child: Text('No notes available'),
              )
                  : ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];

                  return Card(
                    child: ListTile(
                      title: Text(note.title),
                      subtitle: Text(note.description),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => editNote(note),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () =>
                                deleteNote(note.id!),
                          ),
                        ],
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