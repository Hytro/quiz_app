import 'package:flutter/material.dart';
import 'package:quiz_app/result.dart';

import './result.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Who\'s your favorite Daedra?',
      'answerText': [
        {'text': 'Clavicus Vile', 'score': 3},
        {'text': 'Hermaeus Mora', 'score': 1},
        {'text': 'Mephala', 'score': 6},
        {'text': 'Nocturnal', 'score': 10}
      ]
    },
    {
      'questionText': 'Who\'s your favorite Aedra?',
      'answerText': [
        {'text': 'Arkay', 'score': 1},
        {'text': 'Julianos', 'score': 4},
        {'text': 'Stendarr', 'score': 7},
        {'text': 'Zenithar', 'score': 10}
      ]
    },
    {
      'questionText': 'What\'s your favorite City?',
      'answerText': [
        {'text': 'Chorrol', 'score': 8},
        {'text': 'Cheydinhal', 'score': 10},
        {'text': 'Leyawiin', 'score': 4},
        {'text': 'Bravil', 'score': 1}
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have more questions!");
    } else {
      print("No more questions!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My quiz app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
