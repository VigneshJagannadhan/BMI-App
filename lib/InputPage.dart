import 'package:bmi_app/results_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'genderBlock.dart';
import 'package:bmi_app/ReusableCard.dart';
import 'constants.dart';
import 'results_page.dart';
import 'BottomButton.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  // const InputPage({Key? key}) : super(key: key);
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age =25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: ReusableCard(
                        colour: selectedGender == Gender.male
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        customCard: GenderBlock(
                          genderIcons: FontAwesomeIcons.mars,
                          gText: 'Male',
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
                        colour: selectedGender == Gender.female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        customCard: GenderBlock(
                          genderIcons: FontAwesomeIcons.venus,
                          gText: 'Female',
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
                    Text('Height',style: kTextStyleOne,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(),style: kDigitStyle,),
                        Text('cm', style: kTextStyleOne,)
                      ],
                    ),
                    Slider(value: height.toDouble(),
                        min: kMinHeight.toDouble(),
                        max: kMaxHeight.toDouble(),
                        activeColor: kPrimaryButtonColor,
                        inactiveColor: kSecondaryButtonColor,
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        }

                    )
                  ],
                )
              ),
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
                          Text('WEIGHT',style: kTextStyleOne,),
                          Text(weight.toString(),style: kDigitStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(icon: Icons.arrow_right_alt_rounded,onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },),
                              SizedBox(width: 10,),
                              RoundIconButton(icon: Icons.add, onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },),
                            ],

                          )
                        ],
                      )
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                        colour: kActiveCardColor,
                        customCard: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE',style: kTextStyleOne,),
                            Text(age.toString(),style: kDigitStyle,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(icon: Icons.arrow_right_alt_rounded,onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },),
                                SizedBox(width: 10,),
                                RoundIconButton(icon: Icons.add, onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },),
                              ],

                            )
                          ],
                        )
                    ),
                  ),

                ],
              ),
            ),
            BottomButton(text: 'CALCULATE',onTap: (){
              
              CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);


              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultsPage(
                bmiResult: calc.calculateBMI(),
                resultValue: calc.getResult(),
                resultInterpretation: calc.getInterpretation(),
              )));}),
          ],
        ));
  }
}



class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon,required this.onPressed});

  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(onPressed: onPressed,
      child: Icon(icon),
      elevation: 6,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),


    );
  }
}
