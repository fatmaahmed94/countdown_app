// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false,
      home: CounterDown(),
    );
  }
}

class CounterDown extends StatefulWidget {
  const CounterDown({super.key});

  @override
  State<CounterDown> createState() => _CounterDownState();
}

class _CounterDownState extends State<CounterDown> {
  int numberOfSeconds = 7;
  Timer? repeatedFunction;
  startTimer() {
    repeatedFunction = Timer.periodic(Duration(seconds: 1), (aaa) {
      setState(() {
        if (numberOfSeconds > 0) {
          numberOfSeconds--;
        } else {
          aaa.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 40, 43),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            (numberOfSeconds > 0)
                ? numberOfSeconds.toString().padLeft(2, "0")
                : "🤩🤩🤩",
            style: (numberOfSeconds > 0)
                ? TextStyle(fontSize: 80, color: Colors.white)
                : TextStyle(fontSize: 44, color: Colors.white),
          ),
          SizedBox(
            height: 22,
          ),
          Text(
            "second ",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          SizedBox(
            height: 22,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  startTimer();
                  if (numberOfSeconds == 0) {
                    setState(() {
                      numberOfSeconds = 4;
                    });
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 38, 19, 207)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                ),
                child: Text(
                  "startTimer",
                  style: TextStyle(fontSize: 19),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              ElevatedButton(
                onPressed: () {
                  repeatedFunction!.cancel();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 141, 27, 90)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                ),
                child: Text(
                  "click here",
                  style: TextStyle(fontSize: 19),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
