import 'dart:ffi';

import 'package:flutter/material.dart';

class BMICalPage extends StatefulWidget {
  static String routeName = "/bmicalculate";
  const BMICalPage({super.key});

  @override
  State<BMICalPage> createState() => _BMICalPageState();
}

class _BMICalPageState extends State<BMICalPage> {
  TextEditingController heightController = TextEditingController();
  double weight = 20.0;
  Gender gender = Gender.male;
  double bmiValue = 0.0;
  String message = "";
  bmiCalculate() {
    double heightControlle = double.parse(heightController.text);

    if (gender == Gender.male) {
      bmiValue = weight / (heightControlle * heightControlle) * 10000;
    } else {
      bmiValue = weight / (heightControlle * heightControlle) * 10000 * 0.9;
    }
    if (bmiValue < 18.5) {
      message = "you are underweight";
    } else if (bmiValue >= 18.5 && bmiValue < 25) {
      message = "you are normal";
    } else if (bmiValue >= 25 && bmiValue < 30) {
      message = "you are overweight";
    } else {
      message = "you are obse";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // margin: EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height / 6,
                color: Colors.grey[100],
                child: Column(
                  children: [
                    const Text(
                      "Weight(kg)",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "${weight.toStringAsFixed(2)} Kg",
                      style: const TextStyle(fontSize: 30),
                    ),
                    Slider(
                      // divisions: 5,
                      onChanged: (value) {
                        weight = value;
                        setState(() {});
                      },
                      value: weight,
                      min: 1,
                      max: 150,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: heightController,
                decoration: const InputDecoration(labelText: "Height(CM)"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      gender = Gender.male;
                      setState(() {});
                    },
                    child: Card(
                      color: gender == Gender.male
                          ? Colors.blue[100]
                          : Colors.grey[100],
                      child: SizedBox(
                        height: 150,
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Male"),
                            Icon(
                              Icons.check_circle,
                              color: gender == Gender.male
                                  ? Colors.green
                                  : Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      gender = Gender.female;
                      setState(() {});
                    },
                    child: Card(
                      color: gender == Gender.female
                          ? Colors.pink[100]
                          : Colors.grey[200],
                      child: SizedBox(
                        height: 150,
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("FeMale"),
                            Icon(
                              Icons.check_circle,
                              color: gender == Gender.female
                                  ? Colors.green
                                  : Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                onPressed: () {
                  bmiCalculate();
                },
                height: 50,
                color: Color(0xFF322751),
                minWidth: double.infinity,
                child: const Text(
                  "Calulate BMI",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Your Bmi Is: ${bmiValue.toStringAsFixed(2)} \n $message ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF322751),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum Gender { male, female }
