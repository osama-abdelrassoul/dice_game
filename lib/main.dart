import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'dart:math';

const cardBorderRadius = BorderRadius.all(Radius.circular(25));

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Roll the Dice',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const DiceGame(),
    );
  }
}

class DiceGame extends StatefulWidget {
  const DiceGame({super.key});

  @override
  DiceGameState createState() => DiceGameState();
}

class DiceGameState extends State<DiceGame> {
  int _dice1 = 1;
  int _dice2 = 1;
  int _wallet = 0;

  void _rollDice() {
    setState(() {
      _dice1 = Random().nextInt(6) + 1;
      _dice2 = Random().nextInt(6) + 1;
      _wallet += _dice1 + _dice2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roll the Dice'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration:
                  const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/logo.png'))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Dice(
                  _dice1
                ),
                const SizedBox(width: 16),
                Dice(_dice2),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [  const Text(
                'Wallet: ',
                style: TextStyle(fontSize: 24),
              ),
                AnimatedFlipCounter(
                  duration: const Duration(milliseconds: 500),
                  value: _wallet, // pass in a value like 2014
                  textStyle: const TextStyle(fontSize: 24),
                ),
              ],
            ),

            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _rollDice,
              child: const Text('Roll Dice'),
            ),

          ],
        ),
      ),
    );
  }
}

class Dice extends StatelessWidget {
  final int number;

  const Dice(this.number, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: AnimatedFlipCounter(
          duration: const Duration(milliseconds: 500),
          value: number, // pass in a value like 2014
          textStyle: const TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
