import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference notes = FirebaseFirestore.instance.collection(
    'notes',
  );

  Future<void> addNote(String note) {
    return notes.add({'note': note, 'created_at': Timestamp.now()});
  }

  Stream<QuerySnapshot> getNotes() {
    return notes.orderBy('created_at', descending: true).snapshots();
  }

  Future<void> deleteNote(String noteId) {
    return notes.doc(noteId).delete();
  }

  Future<void> updateNote(String noteId, String newNote) {
    return notes.doc(noteId).update({
      'note': newNote,
      'updated_at': Timestamp.now(),
    });
  }
}
