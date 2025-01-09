part  of 'add_notes_cubit.dart';

@immutable
abstract class AddNotesState {}
class AddNoteInitial extends AddNotesState {}
class AddNoteloading extends AddNotesState {}
class AddNoteSucess extends AddNotesState {}
class AddNoteFailure extends AddNotesState {
  final String errMessage;
  AddNoteFailure(this.errMessage);
}