import 'package:bmi_calculator/homepage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _namecont = TextEditingController();
  String name = "";
  void setname() {
    setState(
      () {
        name = _namecont.text;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  margin: const EdgeInsets.all(20),
                  child: Image.asset('assets/bmi.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: _namecont,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      hintText: "Enter Name",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    setname();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          namee: name,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Dive in.",
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
