import 'package:flutter/material.dart';
// check my static variable file.
// &, https://dart.dev/effective-dart/design#avoid-defining-a-class-that-contains-only-static-members
class AppTextStyle{
  static get kLabelTextStyle => const TextStyle(
    fontSize: 18,
    color: Color(0xFF808E98),
  );
  static get kValueTextStyle => const TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold, //FontWeight.w900,
  );
  static get kTitleTextStyle => const TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.bold,
  );
  static get kResultTextStyle => const TextStyle(
    color:Color(0xFF240876),
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  static get kBMITextStyle => const TextStyle(
    fontSize: 100,
    fontWeight: FontWeight.bold,
  );
  static get kBodyTextStyle => const TextStyle(
    fontSize: 22,

  );
}
// here, 'k' for constant ^