import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit/notescupit_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custome_card.dart';

class notsItemList extends StatelessWidget {
  const notsItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotescupitCubit, NotescupitState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotescupitCubit>(context).notes ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return  customeNoteItem(
                  note: notes[index],
                );
              }),
        );
      },
    );
  }
}
