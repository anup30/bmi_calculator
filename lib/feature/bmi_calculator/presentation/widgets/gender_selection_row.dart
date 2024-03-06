import 'package:bmi_calculator/core/constants.dart';
import 'package:bmi_calculator/core/gender.dart';
import 'package:flutter/material.dart';
import 'gender_card.dart';

class GenderSelectionRow extends StatefulWidget {
  final Gender selectedGender;
  final Function(Gender) onSelectGender; // function taking Gender type param

  const GenderSelectionRow(
      {Key? key,
        required this.selectedGender,
        required this.onSelectGender // function
      }) : super(key: key);
  @override
  State<GenderSelectionRow> createState() => _GenderSelectionRowState();
}

class _GenderSelectionRowState extends State<GenderSelectionRow> {
  late Gender selectedGender = widget.selectedGender; // here final type is error

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GenderCard( // GenderCard for male
            gender: Gender.male,
            color: selectedGender == Gender.male? kActiveCardColour: kInactiveCardColour,
            onTap: (gender) { // <----------------------------------------- ?
              setState(() {
                selectedGender = gender;
              });
              widget.onSelectGender(gender); // function
            },
          ),
        ),
        const SizedBox(width: 16,),
        Expanded(
          child: GenderCard( // GenderCard for female
            gender: Gender.female,
            color: selectedGender == Gender.female? kActiveCardColour : kInactiveCardColour,
            onTap: (gender) {
              setState(() {
                selectedGender = gender;
              });
              widget.onSelectGender(gender);
            },
          ),
        ),
      ],
    );
  }
}