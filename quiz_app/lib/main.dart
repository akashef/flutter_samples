import 'package:flutter/material.dart';
import './answer.dart';
import './result.dart';
import './quiz.dart';
import './question.dart';

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
      "question": "Question 1",
      "answer": [
        {"text": "answer Q1 1", "score": 1},
        {"text": "answer Q1 2", "score": 2},
        {"text": "answer Q1 3", "score": 3},
        {"text": "answer Q1 4", "score": 4},
      ]
    },
    {
      "question": "Question 2",
      "answer": [
        {"text": "answer Q1 1", "score": 1},
        {"text": "answer Q1 2", "score": 2},
        {"text": "answer Q1 3", "score": 3},
        {"text": "answer Q1 4", "score": 4},
      ]
    },
    {
      "question": "Question 3",
      "answer": [
        {"text": "answer Q1 1", "score": 1},
        {"text": "answer Q1 2", "score": 2},
        {"text": "answer Q1 3", "score": 3},
        {"text": "answer Q1 4", "score": 4},
      ]
    },
  ];
  // This widget is the root of your application.
  var _questionIndex = 0;
  var _totalscore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalscore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Question App")),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalscore, _resetQuiz),
      ),
    );
  }
}
