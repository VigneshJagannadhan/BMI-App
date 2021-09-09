import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'genderBlock.dart';
import 'package:bmi_app/ReusableCard.dart';

const BottomContainerHeight = 80.0;
const ActiveColor = Color(0xFF1D1E33);
const InactiveColor = Color(0xFF111328);
const SecondaryColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  // const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColour = InactiveColor;
  Color femaleCardColour = InactiveColor;


  void updateColor(int gender){
    if (gender ==1){
      if(maleCardColour == InactiveColor){
        maleCardColour = ActiveColor;
        femaleCardColour = InactiveColor;
      }
      else{
        maleCardColour = InactiveColor;
      }
    }
    else{
      if(femaleCardColour == InactiveColor){
        femaleCardColour = ActiveColor;
        maleCardColour = InactiveColor;
      }
      else{
        femaleCardColour = InactiveColor;
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          updateColor(1);
                        });
                      },
                      child: ReusableCard(
                        colour: maleCardColour,
                        customCard: GenderBlock(
                          genderIcons: FontAwesomeIcons.mars,
                          gText: 'Male',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          updateColor(2);
                        });
                      },
                      child: ReusableCard(
                        colour: femaleCardColour,
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
                colour: ActiveColor,
                customCard: GenderBlock(
                  genderIcons: FontAwesomeIcons.venusMars,
                  gText: 'height',
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: ActiveColor,
                      customCard: GenderBlock(
                        genderIcons: FontAwesomeIcons.venusDouble,
                        gText: 'Weight',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: ActiveColor,
                      customCard: GenderBlock(
                        genderIcons: FontAwesomeIcons.addressCard,
                        gText: 'Male',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: SecondaryColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: BottomContainerHeight,
            ),
          ],
        ));
  }
}
