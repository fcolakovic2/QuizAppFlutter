import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/question.dart';
import 'package:flutter_complete_guide/result.dart';

import './answer.dart';
import './quiz.dart';

void main() {
  runApp(MyQuizApp());
}

class MyQuizApp extends StatefulWidget {
  @override
  _MyQuizAppState createState() => _MyQuizAppState();
}

class _MyQuizAppState extends State<MyQuizApp> {
  static const _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 8},
        {'text': 'Green', 'score': 5},
        {'text': 'White', 'score': 3}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 3},
        {'text': 'Mouse', 'score': 8},
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Snake', 'score': 10}
      ],
    },
    {
      'questionText': 'What\'s your favorite framework?',
      'answers': [
        {'text': 'Flutter', 'score': 10},
        {'text': 'Flutter', 'score': 10},
        {'text': 'Flutter', 'score': 10},
        {'text': 'Flutter', 'score': 10}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
  }

  void _resetirajScore() {
    setState(() {
      //build metoda ce se trigerovat i sve ce se resetirati, setState doslovce pozove build rucno
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'My First Quiz App',
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(_questions, _answerQuestion, _questionIndex)
            : Result(_totalScore, _resetirajScore),
      ),
    );
  }
}
