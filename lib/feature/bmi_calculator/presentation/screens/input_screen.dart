import 'package:bmi_calculator/core/constants.dart';
import 'package:bmi_calculator/core/gender.dart';
import 'package:bmi_calculator/core/text_styles.dart';
import 'package:bmi_calculator/feature/bmi_calculator/presentation/widgets/gender_selection_row.dart';
import 'package:bmi_calculator/feature/bmi_calculator/presentation/widgets/height_slider_section.dart';
import 'package:bmi_calculator/feature/bmi_calculator/presentation/widgets/rounded_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/feature/bmi_calculator/presentation/widgets/weight_age_row.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final String st ="my text";
  Gender selectedGender = Gender.male;
  int heightInCm = 70; // avg 1yr babies 74cm
  int ageYr=1;
  int weightKg=9; // avg 1yr babies 9 kg
  double? bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GenderSelectionRow(
              selectedGender: selectedGender,
              onSelectGender: (genderParam) {
                selectedGender = genderParam;
              },
            ),
            const SizedBox( height: 16,),
            HeightSliderSection(
              height: heightInCm,
              onChangeHeight: (value) {
                heightInCm = value;
              },
            ),
            const SizedBox( height: 16,),
            WeightAgeRow(
              age:ageYr,
              weight:weightKg,
              onSelectAge:(ageParam){ageYr=ageParam;},
              onSelectWeight: (weightParam){weightKg=weightParam;}
            ),
            const SizedBox( height: 16,),
            InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: (){
                calculateBmi();
                showSnackBar();
              }, //weightKg,heightInCm
              child: SizedBox(
                  width: double.infinity,
                  child: RoundedCard(
                      color: kBottomContainerColour,
                      child: Text("Check Result",
                        style: AppTextStyle.kValueTextStyle,
                        textAlign: TextAlign.center,
                      ),
                  ),
              ),
            ),
            const SizedBox( height: 16,),
            SizedBox(
              //width: double.infinity,
              child: RoundedCard(
                color: kBottomContainerColour,
                child: Text("${bmi?.toStringAsFixed(1)}",
                  style: AppTextStyle.kValueTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateBmi() { //int weightKg, int heightInCm
    //print("weight= $weightKg, height= $heightInCm");
    setState(() {
      bmi= weightKg/(heightInCm*heightInCm/10000);
    });
  }
  void showSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.purple,
      content: Center(child: Text("snackBar $st",style: const TextStyle(color: Colors.white,fontSize: 20,),),),
      duration: const Duration(seconds: 3),
    ));
  }
}