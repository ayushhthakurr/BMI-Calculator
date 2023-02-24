import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'round_icon_button.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? choosingGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      choosingGender = Gender.male;
                    });
                  },
                  child: ReusableCard(
                    colour: choosingGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      choosingGender = Gender.female;
                    });
                  },
                  child: ReusableCard(
                    colour: choosingGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            const Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: const Color(0xFF8D8E98),
                            activeTrackColor: Colors.white,
                            thumbColor: const Color(0xFFEB1555),
                            overlayColor: const Color(0x29EB1555),
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 15.0),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 30.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(FontAwesomeIcons.minus),
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          IconButton(
                              icon: const Icon(FontAwesomeIcons.plus),
                              onPressed: () {
                                print(weight);
                                setState(() {
                                  weight++;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(FontAwesomeIcons.minus),
                            onPressed: () {
                              setState(
                                () {
                                  age--;
                                },
                              );
                            },
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          IconButton(
                              icon: const Icon(FontAwesomeIcons.plus),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              })
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero, backgroundColor: Colors.pink),
            onPressed: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              // context can be used here...
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResults(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: BottomButton(onTap: () {}, buttonTitle: 'CALCULATE'),
          ),
        ],
      ),
    );
  }
}
