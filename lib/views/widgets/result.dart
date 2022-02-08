import 'package:first_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler, {Key? key}) : super(key: key);

  String get resultPhrase {
    var resultText = 'You did it!';

    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent! 🤩';
    } else if (resultScore <= 12) {
      resultText = 'You are pretty likeable! 🤓';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strange?! 🥴';
    } else {
      resultText = 'You are evil 👹';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultPhrase,
            style: kResultPhraseTextStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              child: kResultRestartText,
              onPressed: resetHandler,
              style: TextButton.styleFrom(
                backgroundColor: kAppColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
