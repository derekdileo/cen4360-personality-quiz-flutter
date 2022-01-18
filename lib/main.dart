import 'package:flutter/material.dart';
import './views/widgets/quiz.dart';
import './views/widgets/result.dart';

// void main() {
//   runApp(MyApp());
// }
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  // Use const if values do not change once a program runs
  // (Compile-time constant)
  // static const questions = [ would also work
  final _questions = const [
    // Create map of question/answers[]
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Cat', 'score': 7},
        {'text': 'Dog', 'score': 1},
      ],
    },
    {
      'questionText': 'Who is your favorite person?',
      'answers': [
        {'text': 'Mel', 'score': 1},
        {'text': 'Maaahge', 'score': 1},
        {'text': 'Sweet Baby Angel', 'score': 1},
        {'text': 'Titi', 'score': 1},
      ],
    },
  ];

  var _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan.shade500,
          title: const Text(
            'First Flutter Application',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: (_questionIndex < _questions.length)
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions)
              : Result(_totalScore),
        ),
      ),
    );
  }
}
