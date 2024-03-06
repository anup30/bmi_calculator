import 'dart:async';

import 'package:bmi_calculator/core/constants.dart';
import 'package:bmi_calculator/core/text_styles.dart';
import 'package:bmi_calculator/feature/bmi_calculator/presentation/widgets/rounded_card.dart';
import 'package:flutter/material.dart';

class WeightAgeRow extends StatefulWidget {
  final int age;
  final Function(int) onSelectAge; // function taking int type param
  final int weight;
  final Function(int) onSelectWeight; // function taking int type param
  const WeightAgeRow({
    Key? key,
    required this.age,
    required this.onSelectAge,
    required this.weight,
    required this.onSelectWeight,
  }) : super(key: key);
  @override
  State<WeightAgeRow> createState() => _WeightAgeRowState();
}

class _WeightAgeRowState extends State<WeightAgeRow> {
  Timer? timer; // dart:async
  late int weight= widget.weight; // late is required here
  int age=1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RoundedCard(
            color:kActiveCardColour,
            child:Column(
              children: [
                Text("WEIGHT(kg.)",style: AppTextStyle.kLabelTextStyle,),
                const SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector( // GestureDetector does not include any built-in visual feedback
                      //borderRadius: BorderRadius.circular(15), // GestureDetector don't have
                      onTap: () {
                        setState(() {
                          weight++;
                        });
                        widget.onSelectWeight(weight);
                      },
                      onLongPress: () => setState(() {
                        timer = Timer.periodic(
                            const Duration(milliseconds: 100), (timer) {
                          setState(() {
                            weight++;
                            widget.onSelectWeight(weight);
                          });
                        });
                      }),
                      onLongPressEnd: (_) => setState(() {
                        timer?.cancel();
                      }),
                      child: const CircleAvatar(
                        radius: 20,
                        child: Icon(
                          Icons.add,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text("$weight",style: AppTextStyle.kValueTextStyle,), // 3 digit weight space ? --------------------
                    CircleAvatar(
                      radius: 20,
                      //backgroundColor: Colors.purple,
                      child: IconButton(
                          onPressed: (){
                            setState(() {weight--;});
                            widget.onSelectWeight(weight);
                          },
                          icon: const Icon(
                            Icons.remove,
                            size: 15,
                            color: Colors.grey,)
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
        const SizedBox( width: 16,),
        Expanded(
          child: RoundedCard(
            color:kInactiveCardColour,
            child:Column(
              children: [
                Text("AGE(yr.)",style: AppTextStyle.kLabelTextStyle,),
                const SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      //backgroundColor: Colors.purple,
                      child: IconButton(
                          onPressed: (){
                            setState(() {age++;});
                            widget.onSelectAge(age);
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 15,
                            color: Colors.grey,)
                      ),
                    ),
                    Text("$age",style: AppTextStyle.kValueTextStyle,),
                    CircleAvatar(
                      radius: 20,
                      //backgroundColor: Colors.purple,
                      child: IconButton(
                          onPressed: (){
                            setState(() {age--;});
                            widget.onSelectAge(age);
                          },
                          icon: const Icon(
                            Icons.remove,
                            size: 15,
                            color: Colors.grey,)
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
