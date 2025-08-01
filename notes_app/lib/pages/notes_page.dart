import 'package:flutter/material.dart';
import 'package:notes_app/models/note_database.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle add note action
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          'This is the notes page.',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }

  void createNote() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Create Note'),
          content: TextField(
            decoration: const InputDecoration(hintText: 'Enter note text'),
            onSubmitted: (text) {
              // Call createNote method from NoteDatabase
              Provider.of<NoteDatabase>(
                context,
                listen: false,
              ).createNote(text);
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }
}
