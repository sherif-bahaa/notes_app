import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit/notescupit_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_Buttom.dart';
import 'package:note_app/widgets/custom_text_filed.dart';

class EditeNoteBody extends StatefulWidget {
  const EditeNoteBody({
    super.key,
    required this.note,
  });
  final NoteModel note;

  @override
  State<EditeNoteBody> createState() => _EditeNoteBodyState();
}

class _EditeNoteBodyState extends State<EditeNoteBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextFiled(
                onChanged: (valu) {
                  title = valu;
                },
                hint: widget.note.title),
            const SizedBox(
              height: 32,
            ),
            CustomTextFiled(
                onChanged: (value) {
                  content = value;
                },
                hint: widget.note.content,
                maxhight: 5),
            const SizedBox(
              height: 40,
            ),
            customButtom(
              onTap: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.content = content ?? widget.note.content;
                widget.note.save();
                BlocProvider.of<NotescupitCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
              text: "Edit",
            ),
          ],
        ),
      ),
    );
  }
}
