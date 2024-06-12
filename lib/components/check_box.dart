import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {
  const CheckBox({
    super.key,
    required this.isSelectedAnswerButton,
    required this.isCorrectAnswer,
  });

  final bool isSelectedAnswerButton;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    var color = isSelectedAnswerButton
        ? Colors.white
        : const Color.fromARGB(255, 124, 141, 249);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: color,
              width: 1.0,
            ),
          ),
          child: Icon(
            isSelectedAnswerButton && isCorrectAnswer
                ? Icons.check
                : Icons.close,
            color: color,
            size: 16.0,
          ),
        ),
      ],
    );
  }
}
