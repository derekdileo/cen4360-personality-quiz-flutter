import 'package:first_app/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:animated_background/animated_background.dart';

class Result extends StatefulWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler, {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ResultState();
  }
}

class _ResultState extends State<Result> with TickerProviderStateMixin {
  String get resultPhrase {
    var resultText = 'You did it!';

    if (widget.resultScore <= 8) {
      resultText = 'You are awesome and innocent! 🤩';
    } else if (widget.resultScore <= 12) {
      resultText = 'You are pretty likeable! 🤓';
    } else if (widget.resultScore <= 16) {
      resultText = 'You are ... strange?! 🥴';
    } else {
      resultText = 'You are evil 👹';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      behaviour: RacingLinesBehaviour(
        direction: LineDirection.Ltr,
        numLines: 50,
      ),
      vsync: this,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 2.0,
                child: Text(
                  resultPhrase,
                  style: kResultPhraseTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: double.infinity,
              child: Theme.of(context).platform == TargetPlatform.iOS
                  ? CupertinoButton(
                      child: kResultRestartText,
                      onPressed: widget.resetHandler,
                      color: kAppColor,
                    )
                  : TextButton(
                      child: kResultRestartText,
                      onPressed: widget.resetHandler,
                      style: TextButton.styleFrom(
                        backgroundColor: kAppColor,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
