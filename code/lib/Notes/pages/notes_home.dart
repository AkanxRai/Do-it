import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/Notes/Models/note.dart';
import 'package:to_do/Notes/Models/note_data.dart';
import 'package:to_do/Notes/pages/edit_page.dart';

class notes extends StatefulWidget {
  const notes({super.key});

  @override
  State<notes> createState() => _notesState();
}

class _notesState extends State<notes> {
  void createNewNote() {
    int id = Provider.of<NoteData>(context, listen: false).getAllNotes().length;
    Note newNote = Note(id: id, text: "");

    goToNotePage(newNote, true);
  }

  void goToNotePage(Note note, bool isNewNote) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditingNotePage(
                  note: note,
                  isNewNote: false,
                )));
  }

  void deleteNote(Note note) {
    Provider.of<NoteData>(context, listen: false).deleteNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, value, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: createNewNote,
          child: Icon(Icons.add),
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25.0, top: 75),
              child: Text(
                "Notes",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            CupertinoListSection.insetGrouped(
                children: List.generate(
                    value.getAllNotes().length,
                    (index) => CupertinoListTile(
                        title: Text(value.getAllNotes()[index].text)))),
            Expanded(
                child: Text(
              "Under development ",
              style: TextStyle(fontSize: 50),
            ))
          ],
        ),
      ),
    );
  }
}
