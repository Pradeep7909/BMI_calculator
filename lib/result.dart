import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  const Result({super.key, required this.result, required this.msg});

  final double result;
  final String msg;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.black,
              height: 100,
              width: 160,
              child: const Center(
                child: Text(
                  "Result",
                  style: TextStyle(fontSize: 24, color: Colors.orange),
                ),
              ),
            ),
            Text(
              widget.result.toStringAsFixed(2),
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              widget.msg,
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
