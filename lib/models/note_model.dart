//{flutter packages pub run build_runner build}=>run in terminal to generate the file

import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel extends HiveObject {
  @HiveField(0)
   int color;
  @HiveField(1)
   String title;
  @HiveField(2)
   String content;
  @HiveField(3)
  final String date;
  NoteModel(
      {required this.date,
      required this.color,
      required this.title,
      required this.content});
}
