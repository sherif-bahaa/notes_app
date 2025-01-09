import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit/notescupit_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edite_note_view.dart';

class customeNoteItem extends StatelessWidget {
  const customeNoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EditeNoteView(
              note: note,
            )));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, bottom: 8, top: 0),
        child: Container(
          height: 180,
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(color: Colors.black, fontSize: 24),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  note.content,
                  style: const TextStyle(
                      color: Color.fromRGBO(5, 0, 0, 0.5), fontSize: 20),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotescupitCubit>(context).fetchAllNotes();
                  
                },
                icon: const Icon(Icons.delete),
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                note.date,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
/*Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              width: 500,
              height: 200,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "flutter",
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Icon(Icons.delete),
                      ],
                    ),
                    Text('descreption'),
                    Row(
                      children: [
                        Spacer(),
                        Text('oct 21,2022'),
                      ],
                    ),
                  ],
                ),
                Connect an Android device via USB cable.
Open the "ADB Wi-Fi" Tool Window (in the right-bottom corner).
Click the "Connect" button.
After a successful connection, you can unplug the USB cable.
              ), */
