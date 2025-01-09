import 'package:flutter/material.dart';

class customButtom extends StatelessWidget {
  const customButtom({
    super.key,
    required this.text,
    this.onTap,
    this.isLoading = false,
  });
  final String text;
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(255, 41, 182, 238),
        ),
        child: Center(
            child:isLoading?const CircularProgressIndicator(
              color: Colors.black,
            )   : Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        )),
      ),
    );
  }
}
