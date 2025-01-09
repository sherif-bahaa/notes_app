import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit/notescupit_cubit.dart';
import 'package:note_app/widgets/notesListView.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotescupitCubit>(context).fetchAllNotes();
    super.initState();
  }

  Widget build(BuildContext context) {
    return const notsItemList();
  }
}
