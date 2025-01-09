import 'package:flutter/material.dart';

import 'package:note_app/widgets/addNotBottumSheet.dart';
import 'package:note_app/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key,});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 3, 26),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              context: context,
              builder: (context) {
                return const addNotBottumSheet();
              });
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(6.0),
          child: Text('Notes App'),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(Icons.search),
            ),
          )
        ],
      ),
      body: const NotesViewBody(),
    );
  }
}
