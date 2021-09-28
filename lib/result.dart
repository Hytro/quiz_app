import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'Good job, you know a little!';
    } else if (resultScore <= 12) {
      resultText = 'Nice, you payed attention!';
    } else if (resultScore <= 16) {
      resultText = 'Almost perfect!';
    } else {
      resultText = 'Oh damn, are you me?';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetHandler,
            child: Text('Restart quiz!'),
            textColor: Colors.green,
          )
        ],
      ),
    );
  }
}
