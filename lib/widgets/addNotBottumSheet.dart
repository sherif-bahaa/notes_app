import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/add_notes_cubit.dart';
import 'package:note_app/cubits/cubit/notescupit_cubit.dart';
import 'package:note_app/widgets/add_note_form.dart';

class addNotBottumSheet extends StatelessWidget {
  const addNotBottumSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
        listener: (context, state) {
          if (state is AddNoteSucess) {
            BlocProvider.of<NotescupitCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
          if (state is AddNoteFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("${state.errMessage} please add note again"),
              ),
            );
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteloading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 16,
              ),
              child: SingleChildScrollView(child: AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}
