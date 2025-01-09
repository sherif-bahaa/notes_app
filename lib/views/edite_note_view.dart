import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/edite_note_body.dart';



class EditeNoteView extends StatelessWidget {
  const EditeNoteView({super.key, required this.note});
final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return  EditeNoteBody(
      note: note,
    );
  }
}
