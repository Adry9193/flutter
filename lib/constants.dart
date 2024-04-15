import 'package:flutter/material.dart';

const primaryColor = Colors.blue;

const secondaryColor = Colors.lightGreen;

const teriaryColor = Color.fromARGB(255, 212, 84, 148);

const appColor = Color.fromARGB(255, 238, 144, 241);

const fromTextStyle = TextStyle(
  fontSize: 15.0,
  fontWeight: FontWeight.w700,
);

const dateTextStyle = TextStyle(
  color: Colors.black45,
  fontSize: 14.0,
  fontWeight: FontWeight.w300,
);

const subjectTextStyle = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.w400,
);

const bodyTextStyle = TextStyle(
  fontSize: 15.0,
);

final textFieldDecoration = InputDecoration(
  hintStyle: TextStyle(
    color: primaryColor.withAlpha(96),
    fontSize: 16.0,
  ),
  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: primaryColor, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: primaryColor, width: 3.0),
  ),
);
