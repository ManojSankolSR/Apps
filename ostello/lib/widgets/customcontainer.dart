import 'package:flutter/material.dart';
import 'package:ostello/main.dart';

//CONTAINER USED TO REPRESENT SUBJECTS IN UI

class customcontainer extends StatelessWidget {
  final String text;
  customcontainer({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: kColor.withOpacity(.40), width: 1)),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 10,
            color: kColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5),
      ),
    );
  }
}
