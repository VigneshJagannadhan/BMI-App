import 'package:bmi_app/ScreensAndPages/results_page.dart';
import '../Components/RoundActionButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/genderBlock.dart';
import 'package:bmi_app/Components/ReusableCard.dart';
import '../constants.dart';
import 'results_page.dart';
import '../Components/BottomButton.dart';
import '../calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180; // CHANGE THIS TO CHANGE THE DEFAULT HEIGHT VALUE IN THE SLIDER
  int weight = 60;  // CHANGE THIS TO CHANGE THE DEFAULT WEIGHT VALUE IN THE RE-USABLE CARD
  int age = 25;  // CHANGE THIS TO CHANGE THE DEFAULT AGE VALUE IN THE RE-USABLE CARD

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')), // MAIN HEADING TEXT
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // TO STRETCH THE COLUMN TO MAX WIDTH
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector( //GESTURE DETECTOR IS UDED TO DETECT GESTURES AND ACT ON DIFFERENT GESTURES AS WE TELL IT TO.
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: ReusableCard(
                        colour: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor, // THIS LINE OF CODE IS A SIMPLIFIED IF ELSE STATEMENT THAT TELLS THE MACHINE TO CHECK IS THE GENDER IS MALE AND IF TRUE ('?') GIVE ACTIVE CARD COLOR TO THE CARD AND OTHERWISE (':') GIVE INACTIVE CARD COLOR
                        customCard: GenderBlock(
                          genderIcons: FontAwesomeIcons.mars,
                          gText: 'Male', //CHANGE THIS TO CHANGE THE TEXT IN THE GENDER BOX
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: ReusableCard(
                        colour: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor, // THIS LINE OF CODE IS A SIMPLIFIED IF ELSE STATEMENT THAT TELLS THE MACHINE TO CHECK IS THE GENDER IS MALE AND IF TRUE ('?') GIVE ACTIVE CARD COLOR TO THE CARD AND OTHERWISE (':') GIVE INACTIVE CARD COLOR
                        customCard: GenderBlock(
                          genderIcons: FontAwesomeIcons.venus,
                          gText: 'Female', //CHANGE THIS TO CHANGE THE TEXT IN THE GENDER BOX
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  colour: kActiveCardColor,
                  customCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: kTextStyleOne,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kDigitStyle,
                          ),
                          Text(
                            'cm',
                            style: kTextStyleOne,
                          )
                        ],
                      ),
                      Slider(
                          value: height.toDouble(),
                          min: kMinHeight.toDouble(),
                          max: kMaxHeight.toDouble(),
                          activeColor: kPrimaryButtonColor,
                          inactiveColor: kSecondaryButtonColor,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          })
                    ],
                  )),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        colour: kActiveCardColor,
                        customCard: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: kTextStyleOne,
                            ),
                            Text(
                              weight.toString(),
                              style: kDigitStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: Icons.arrow_right_alt_rounded,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                  icon: Icons.add,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                  Expanded(
                    child: ReusableCard(
                        colour: kActiveCardColor,
                        customCard: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: kTextStyleOne,
                            ),
                            Text(
                              age.toString(),
                              style: kDigitStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: Icons.arrow_right_alt_rounded,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                  icon: Icons.add,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
            BottomButton(
                text: 'CALCULATE',
                onTap: () {
                  CalculatorBrain calc =
                      CalculatorBrain(weight: weight, height: height);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultsPage(
                                bmiResult: calc.calculateBMI(),
                                resultValue: calc.getResult(),
                                resultInterpretation: calc.getInterpretation(),
                              )));
                }),
          ],
        ));
  }
}
