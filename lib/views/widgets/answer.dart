import 'package:first_app/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  const Answer(this.selectHandler, this.answerText, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      color: kAppColor,
      child: Theme.of(context).platform == TargetPlatform.iOS
          ? CupertinoButton(
              child: Text(
                answerText,
                style: kAnswerTextStyle,
              ),
              onPressed: selectHandler,
            )
          : TextButton(
              child: Text(
                answerText,
                style: kAnswerTextStyle,
              ),
              onPressed: selectHandler,
            ),
    );
  }
}
