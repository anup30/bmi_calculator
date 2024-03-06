// BMI Calculator // todo: add snackBar with appropriate message
// 17.2.24 

import 'package:bmi_calculator/feature/bmi_calculator/presentation/screens/input_screen.dart';
import 'package:flutter/material.dart';

void main(){runApp(const BmiCalculator()); }

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const InputScreen(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.yellow, // Color(0xFF0A0E21), // no effect?
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
    );
  }
}

