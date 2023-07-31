import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          elevation: 0.0,
          title: const Text('Rolling Dice'),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        body: const MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var leftDiceNumber = 1;
  var rightDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 12.0,
        ),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: roll,
                child: Image.asset('assets/images/dice$leftDiceNumber.png'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 12.0,
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: roll,
                child: Image.asset('assets/images/dice$rightDiceNumber.png'),
              ),
            )
          ],
        ),
      ),
    );
  }

  void roll() {
    setState(() {
      leftDiceNumber = Random().nextInt(5) + 1;
      rightDiceNumber = Random().nextInt(5) + 1;
    });
  }
}
