import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/services/firestore_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirestoreService _firestoreService = FirestoreService();
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openNoteBox(null),
        child: Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestoreService.getNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No notes available'));
          }
          final notes = snapshot.data!.docs;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final document = notes[index];
              final String docId = document.id;
              return ListTile(
                title: Text(document['note']),
                subtitle: Text(document['created_at'].toDate().toString()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => {
                        _noteController.text = document['note'],
                        openNoteBox(docId),
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _firestoreService.deleteNote(docId);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  void openNoteBox(String? docId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(docId == null ? 'Add Note' : 'Edit Note'),
          content: TextField(
            controller: _noteController,
            decoration: InputDecoration(hintText: 'Enter your note'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _noteController.clear();
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (docId != null) {
                  // Update existing note
                  _firestoreService.updateNote(docId, _noteController.text);
                } else {
                  // Add new note
                  _firestoreService.addNote(_noteController.text);
                }
                _noteController.clear();
                Navigator.of(context).pop();
              },
              child: Text(docId == null ? 'Add' : 'Update'),
            ),
          ],
        );
      },
    );
  }
}
