import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';

enum Gender { male, female, other }

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.namee});
  final String namee;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double bmi = 0;
  int weight = 40;
  int age = 20;
  Gender gender = Gender.other;
  double height = 150;
  double heightmeter = 0;
  double heightsquare = 0;
  String message = "";

  void calculateBMI() {
    setState(
      () {
        heightmeter = height / 100;
        heightsquare = heightmeter * heightmeter;
        bmi = weight / heightsquare;
        if (bmi < 18.5) {
          message = "UnderWeight - You need to increase diet ";
        } else if (bmi < 24.9) {
          message = "Normal - You are fit ";
        } else {
          message = "UnderWeight - You need to avoid junk food";
        }
      },
    );
  }

  void iage() {
    setState(() {
      age++;
    });
  }

  void dage() {
    setState(() {
      age--;
    });
  }

  void iweight() {
    setState(() {
      weight++;
    });
  }

  void dweight() {
    setState(() {
      weight--;
    });
  }

  void changeGender(val) {
    setState(
      () {
        gender = val;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("BMI Calculator"),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.light_mode),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.dark_mode),
                ),
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Hello ",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    widget.namee,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      changeGender(Gender.male);
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color:
                            gender == Gender.male ? Colors.blue : Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.male,
                            size: 40,
                            color: Colors.white,
                          ),
                          Text(
                            "Male",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      changeGender(Gender.female);
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: gender == Gender.female
                            ? Colors.pink
                            : Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.female,
                            size: 40,
                            color: Colors.white,
                          ),
                          Text(
                            "Female",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Height",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    height.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  Slider(
                    value: height,
                    onChanged: (double value) {
                      setState(
                        () {
                          height = value;
                        },
                      );
                    },
                    min: 20,
                    max: 250,
                    activeColor: Colors.red,
                    inactiveColor: Colors.white,
                    label: height.round().toString(),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Weight",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "$weight Kg",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: iweight,
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder()),
                              child: const Padding(
                                padding: EdgeInsets.all(12),
                                child: Icon(Icons.add),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: dweight,
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder()),
                              child: const Padding(
                                padding: EdgeInsets.all(12),
                                child: Icon(Icons.remove),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Age",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "$age Yr",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: iage,
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder()),
                              child: const Padding(
                                padding: EdgeInsets.all(12),
                                child: Icon(Icons.add),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: dage,
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder()),
                              child: const Padding(
                                padding: EdgeInsets.all(12),
                                child: Icon(Icons.remove),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                calculateBMI();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(
                      result: bmi,
                      msg: message,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const SizedBox(
                height: 70,
                child: Center(
                  child: Text(
                    "Calculate",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
