import 'package:flutter/material.dart';
import 'dart:math';

const Color bgColor = Color.fromARGB(255, 255, 255, 255);
const Color primaryColor = Color.fromARGB(255, 255, 169, 71);
const Color primaryColor2 = Color.fromRGBO(102, 5, 34, 1);
const Color primaryColor3 = Color.fromRGBO(163, 0, 0, 1);

class As3 extends StatelessWidget {
  const As3({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      home: const RandomDemo(),
    );
  }
}

class RandomDemo extends StatefulWidget {
  const RandomDemo({super.key});
  @override
  State<RandomDemo> createState() => _RandomDemoState();
}

class _RandomDemoState extends State<RandomDemo> {
  final _controller = TextEditingController();
  int _randomNumber = 0;
  int _attemptsLeft = 3;
  String _message = '';
  @override
  void initState() {
    super.initState();
    _generateRandomNumber();
  }

  void _generateRandomNumber() {
    _randomNumber = Random().nextInt(10);
  }

  void _guessNumber() {
    final guess = int.tryParse(_controller.text);
    if (guess == null || guess < 0 || guess > 9) {
      setState(() {
        _message = '';
      });
      return;
    }
    setState(() {
      if (guess == _randomNumber) {
        _message = 'Correct, you win!';
      } else {
        _attemptsLeft--;
        if (_attemptsLeft > 0) {
          _message = guess < _randomNumber
              ? '$guess is too small, $_attemptsLeft attempts left.'
              : '$guess is too large, $_attemptsLeft attempts left.';
        } else {
          _message = 'Sorry,you lost. The answer is $_randomNumber';
        }
      }
      if (_attemptsLeft == 0) {
        _controller.clear();
      }
    });
  }

  void _resetGame() {
    setState(() {
      _generateRandomNumber();
      _attemptsLeft = 3;
      _message = '';
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          'Guess a number game',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Guess a number 0-9',
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _guessNumber,
          child: Text('Guess'),
        ),
        SizedBox(height: 20),
        Text(
          _message,
          style: TextStyle(fontSize: 18, color: Colors.red),
        ),
        SizedBox(height: 15),
        ElevatedButton(
          onPressed: _resetGame,
          child: Text('Restart'),
        ),
      ],
    ));
  }
}
