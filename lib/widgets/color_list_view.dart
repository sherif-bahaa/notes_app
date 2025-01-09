import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/add_notes_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? Padding(
            padding: const EdgeInsets.only(
              left: 3,
              right: 3,
              bottom: 4,
            ),
            child: CircleAvatar(
              radius: 32,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 27,
                backgroundColor: color,
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 1, right: 1, bottom: 16),
            child: CircleAvatar(
              backgroundColor: color,
              radius: 32,
            ),
          );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int selectedColor = 0;
  List<Color> colors = const [
    Color(0xff0fa3b1),
    Color(0xffb5e2fa),
    Color(0xfff9f7f3),
    Color(0xffeddea4),
    Color(0xfff7a072),
    Color(0xff1f363d),
    Color(0xff0d2818),
    Color(0xff04471c),
    Color(0xff058c42),
    Color(0xff16db65),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              selectedColor = index;
              BlocProvider.of<AddNotesCubit>(context).color = colors[index];
              setState(() {});
            },
            child: ColorItem(
              color: colors[index],
              isActive: selectedColor == index,
            ),
          );
        },
      ),
    );
  }
}
