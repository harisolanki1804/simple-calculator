// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String btnText;
  final btnTextColor;
  final btnBgColor;
  final VoidCallback? btnTask;

  RoundedButton(
      {required this.btnText,
      required this.btnTextColor,
      required this.btnBgColor,
      required this.btnTask});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(btnText,
          style: TextStyle(
              color: btnTextColor, fontSize: 42, fontWeight: FontWeight.w700)),
      onPressed: btnTask,
      style: TextButton.styleFrom(
        backgroundColor: btnBgColor,
        shape: const CircleBorder(),
      ),
    );

    // return GestureDetector(
    //   onTap: btnTask,
    // )
  }
}
