import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 60;

  String gender = '';

  late double bmi = calculateBMI(height: height, weight: weight);
  // define thw variable when loading and assing the value later

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      gender = 'M';
                    });
                  },
                  child: Container(
                    height: 220,
                    width: 190,
                    decoration: BoxDecoration(
                        color: gender == 'M'
                            ? Colors.blue
                            : Colors.blue.withAlpha(30),
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.male,
                          size: 150,
                        ),
                        Text("Male"),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      gender = 'F';
                    });
                  },
                  child: Container(
                    height: 220,
                    width: 190,
                    decoration: BoxDecoration(
                        color: gender == 'F'
                            ? Colors.pink
                            : Colors.pink.withAlpha(30),
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.female,
                          size: 150,
                        ),
                        Text("Female"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("Height"),
                      Text(
                        "$height",
                        style: kInputLabelColor,
                      ),
                      Row(
                        children: [
                          FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height > 50) height--;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 40,
                              )),
                          const SizedBox(width: 25),
                          FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height < 220) height++;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: Icon(
                                Icons.add,
                                size: 40,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("Weight"),
                      Text(
                        "$weight",
                        style: kInputLabelColor,
                      ),
                      Row(
                        children: [
                          FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 10) weight--;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 40,
                              )),
                          const SizedBox(width: 25),
                          FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight < 250) weight++;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: Icon(
                                Icons.add,
                                size: 40,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Text("BMI"),
                Text(
                  bmi.toStringAsFixed(2),
                  style: kInputLabelColor.copyWith(
                      color: kOutputTextColor, fontSize: 60),
                ),
                Text(
                  getResult(bmi),
                  style: kInputLabelColor.copyWith(
                      color: kBMIOutputTextColor, fontSize: 40),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }

  double calculateBMI({required int height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }

  static getResult(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi < 25) {
      return "Normal";
    } else if (bmi < 30) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }
}
