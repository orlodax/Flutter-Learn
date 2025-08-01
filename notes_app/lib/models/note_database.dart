import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:notes_app/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  final List<Note> currentNotes = [];

  // Example method to create a note
  Future<void> createNote(String text) async {
    final note = Note()..text = text;

    await isar.writeTxn(() async {
      await isar.notes.put(note);
    });

    readNotes();
  }

  // Example method to read notes
  Future<void> readNotes() async {
    currentNotes.clear();
    currentNotes.addAll(await isar.notes.where().findAll());
    notifyListeners();
  }

  // Example method to update a note
  Future<void> updateNote(int id, String title, String content) async {
    final note = await isar.notes.get(id);
    if (note != null) {
      note.text = content;

      await isar.writeTxn(() async {
        await isar.notes.put(note);
      });

      readNotes();
    }
  }

  // Example method to delete a note
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() async {
      await isar.notes.delete(id);
    });
    readNotes();
  }
}
