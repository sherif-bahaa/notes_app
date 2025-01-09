import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/constants.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNoteInitial());
  Color color = const Color(0xff0fa3b1);
  addNot(NoteModel note) async {
    note.color = color.value;
    emit(AddNoteloading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(AddNoteSucess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
