import 'package:flutter/material.dart';
import 'package:to_do/Notes/Models/note.dart';

class NoteData extends ChangeNotifier {
  List<Note> allNotes = [
    Note(id: 0, text: "First Note"),
    Note(id: 1, text: "First Not"),
  ];

  List<Note> getAllNotes() {
    return allNotes;
  }

  void addNewNote(Note note) {
    allNotes.add(note);
    notifyListeners();
  }

  void updateNote(Note note, String text) {
    for (int i = 0; i < allNotes.length; i++) {
      if (allNotes[i].id == note.id) {
        allNotes[i].text = text;
      }
    }
    notifyListeners();
  }

  void deleteNote(Note note) {
    allNotes.remove(note);
  }
}
