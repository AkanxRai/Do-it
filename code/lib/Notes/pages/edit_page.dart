import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';
import 'package:to_do/Notes/Models/note.dart';
import 'package:to_do/Notes/Models/note_data.dart';

class EditingNotePage extends StatefulWidget {
  const EditingNotePage({super.key, required this.note, required this.isNewNote});

  final Note note;
  final bool isNewNote;

  @override
  State<EditingNotePage> createState() => _EditingNotePageState();
}

class _EditingNotePageState extends State<EditingNotePage> {
  final QuillEditorConfigurations quillEditorConfigurations = QuillEditorConfigurations(
    // Define quill editor configurations here
  );
  final FocusNode focusNode = FocusNode();
  final ScrollController scrollController = ScrollController();

  QuillController _controller = QuillController.basic();

  @override
  void initState() {
    super.initState();
    loadExistingNote();
  }

  void loadExistingNote() {
    final doc = Document()..insert(0, widget.note.text);
    setState(() {
      _controller = QuillController(
        document: doc,
        selection: const TextSelection.collapsed(offset: 0),
      );
    });
  }

  void addNewNote(int id) {
    String text = _controller.document.toPlainText();
    Provider.of<NoteData>(context, listen: false)
        .addNewNote(Note(id: id, text: text));
  }

  void updateNote() {
    String text = _controller.document.toPlainText();
    Provider.of<NoteData>(context, listen: false).updateNote(widget.note, text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(25),
              
              ),
          )
        ],
      ),
    );
  }
}
