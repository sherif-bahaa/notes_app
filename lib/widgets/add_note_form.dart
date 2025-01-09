import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/add_note_cubit/add_notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/color_list_view.dart';
import 'package:note_app/widgets/custom_Buttom.dart';
import 'package:note_app/widgets/custom_text_filed.dart';

class AddNoteForm extends StatefulWidget {
  AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          CustomTextFiled(
            onSaved: (value) {
              title = value;
            },
            hint: "Title",
          ),
          const SizedBox(
            height: 32,
          ),
          CustomTextFiled(
            onSaved: (value) {
              content = value;
            },
            hint: "content",
            maxhight: 5,
          ),
          const SizedBox(
            height: 20,
          ),
          const ColorListView(),
          BlocBuilder<AddNotesCubit, AddNotesState>(
            builder: (context, state) {
              return customButtom(
                isLoading: state is AddNoteloading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var currentDate = DateTime.now();
                    var dateFormater =
                        DateFormat("dd-mm-yyyy").format(currentDate);
                    var note = NoteModel(
                        title: title!,
                        content: content!,
                        date: dateFormater,
                        color: Colors.blue.value);
                    BlocProvider.of<AddNotesCubit>(context).addNot(note);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: "Add",
              );
            },
          ),
        ],
      ),
    );
  }
}
