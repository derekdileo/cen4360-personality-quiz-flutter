import 'package:flutter/material.dart';
import 'package:first_app/utilities/constants.dart';

class Question extends StatelessWidget {
  final String questionText;

  const Question(this.questionText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        questionText,
        style: kQuestionTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
