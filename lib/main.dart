import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'Who\'s your favorite Daedra?',
        'answerText': ['Clavicus Vile', 'Hermaeus Mora', 'Mephala', 'Nocturnal']
      },
      {
        'questionText': 'Who\'s your favorite Aedra?',
        'answerText': ['Arkay', 'Julianos', 'Stendarr', 'Zenithar']
      },
      {
        'questionText': 'What\'s your favorite City?',
        'answerText': ['Chorrol', 'Cheydinhal', 'Leyawiin', 'Bravil']
      }
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My quiz app'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answerText'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
