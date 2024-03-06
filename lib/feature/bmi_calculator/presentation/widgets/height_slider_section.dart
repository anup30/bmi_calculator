import 'package:bmi_calculator/core/constants.dart';
import 'package:bmi_calculator/core/text_styles.dart';
import 'package:bmi_calculator/feature/bmi_calculator/presentation/widgets/rounded_card.dart';
import 'package:flutter/material.dart';

class HeightSliderSection extends StatefulWidget {
  final int height;
  final Function(int) onChangeHeight;

  const HeightSliderSection({
    Key? key,
    required this.height,
    required this.onChangeHeight
  }): super(key: key);
  @override
  State<HeightSliderSection> createState() => _HeightSliderSectionState();
}

class _HeightSliderSectionState extends State<HeightSliderSection> {
  late int height = widget.height;

  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      color: kActiveCardColour,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'HEIGHT',
              style: AppTextStyle.kLabelTextStyle,
            ),
            const SizedBox( height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              textBaseline: TextBaseline.alphabetic, // <-------------------------
              crossAxisAlignment: CrossAxisAlignment.baseline,
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  height.toString(),
                  style: AppTextStyle.kValueTextStyle,
                ),
                Text(
                  ' cm',
                  style: AppTextStyle.kLabelTextStyle,
                ),
              ],
            ),
            SliderTheme(
              data: kHeightSliderTheme(context), // <-------------------------
              child: Slider(
                value: height / 200, // <---
                onChanged: (value) { // value is 0 to 1, provided by Slider
                  setState(
                        () {
                      height = (value*200).toInt(); // highest height =200 cm = 200/30.48 feet = approx 6.5
                    },
                  );
                  widget.onChangeHeight(height);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}