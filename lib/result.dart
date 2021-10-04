import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetiraj;
  Result(this.resultScore, this.resetiraj);

  String get resultPhrase {
    var resultText = 'You finished it!';
    if (resultScore <= 8) {
      resultText = 'You failed the test';
    } else {
      resultText = 'You passed the test';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(resultPhrase,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          RaisedButton(
              child: Text('Restart quiz'),
              color: Colors.blue,
              onPressed: resetiraj)
        ],
      ),
    );
  }
}
