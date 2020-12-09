import 'package:flutter/cupertino.dart';
import 'results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'bottombutton.dart';
import 'Roundbutton.dart';
import 'calci-brain.dart';
enum Gen { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gen selected;
  int height = 160;
  int weight = 60;
  int age = 20;
  /* Color malecard = inactivecolor;
  Color femalecard = inactivecolor;

 void updateColor(Gen gender) {
    if (gender == Gen.male) {
      malecard == inactivecolor? malecard = activecolor:femalecard = inactivecolor;
      } else {
        malecard = inactivecolor;
      }
    }
    if (gender == Gen.female) {
      if (femalecard == inactivecolor) {
        femalecard = activecolor;
        malecard = inactivecolor;
      } else {
        femalecard = inactivecolor;
      }
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reusable(
                    onPress: () {
                      setState(() {
                        selected = Gen.male;
                      });
                    },
                    colour:
                        selected == Gen.male ? kactivecolor : kinactivecolor,
                    cardchild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: Reusable(
                    onPress: () {
                      setState(() {
                        selected = Gen.female;
                      });
                    },
                    colour:
                        selected == Gen.female ? kactivecolor : kinactivecolor,
                    cardchild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reusable(
              colour: kactivecolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: klabelstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumstyle,
                      ),
                      Text(
                        ' cm',
                        style: klabelstyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D9E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x1fEB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 90,
                      max: 250,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reusable(
                    colour: kactivecolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: klabelstyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reusable(
                    colour: kactivecolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: klabelstyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Bottombutton(title: 'CALCULATE',
          onTap:  (){
            Brain calci = Brain(weight: weight,height: height);

            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultsPage(
             bmiresult: calci.calculatebmi(),
             resultText: calci.getresult(),
             interpretation: calci.interpretation(),
            )));
          },),
        ],
      ),
    );
  }
}

