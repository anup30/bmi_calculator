import 'package:bmi_calculator/core/gender.dart';
import 'package:bmi_calculator/core/text_styles.dart';
import 'package:bmi_calculator/feature/bmi_calculator/presentation/widgets/rounded_card.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final Gender gender;
  final Color color;
  final Function(Gender) onTap;

  const GenderCard(
      {Key? key,
        required this.gender,
        required this.color,
        required this.onTap, // function
        }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15), // to remove sharp corner visual effect onTap
      onTap: () {
        onTap(gender); // <------------------------
      },
      child: RoundedCard(
        color: color,
        child: Column(
          children: [
            Icon(
              gender == Gender.male ? Icons.male : Icons.female,
              size: 80,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              gender == Gender.male ? 'Male' : 'Female',
              style: AppTextStyle.kLabelTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}