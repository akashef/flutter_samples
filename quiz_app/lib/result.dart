import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  Result(this.resultScore, this.resetHandler);
  String get resultTxt {
    String resultTxt = "";
    if (resultScore > 11) {
      resultTxt = "you are awsome";
    } else if (resultScore > 6) {
      resultTxt = "Good, Very Well";
    } else {
      resultTxt = "Passed";
    }
    return resultTxt;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultTxt,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed: resetHandler, child: Text('Restart Quiz!')),
        ],
      ),
    );
  }
}
