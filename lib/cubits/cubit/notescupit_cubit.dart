import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/constants.dart';

part 'notescupit_state.dart';

class NotescupitCubit extends Cubit<NotescupitState> {
  NotescupitCubit() : super(NotescupitInitial());
  List<NoteModel>? notes;
  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(NotescupitSuccess());
  }
}
