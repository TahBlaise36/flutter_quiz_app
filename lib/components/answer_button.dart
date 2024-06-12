import 'package:flutter/material.dart';
import 'package:quiz_app/components/check_box.dart';
import 'package:quiz_app/components/text_styles.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.correctAnswer,
    required this.isCorrectAnswer,
    required this.isSelectedAnswerButton,
    required this.setButtonClicked,
    required this.color,
    required this.backgroundColor,
  });

  final String answerText;
  final String correctAnswer;
  final bool isCorrectAnswer;
  final void Function() setButtonClicked;
  final Color color;
  final Color backgroundColor;
  final bool isSelectedAnswerButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: Matrix4.translationValues(
            isSelectedAnswerButton ? 26.0 : 0.0, 0.0, 0.0),
        child: ElevatedButton(
          onPressed: () {
            if (isSelectedAnswerButton) {
            } else {
              setButtonClicked();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            padding: const EdgeInsets.all(22.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextStyles(
                        color: color,
                        answerText,
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isSelectedAnswerButton,
                child: CheckBox(
                  isSelectedAnswerButton: isSelectedAnswerButton,
                  isCorrectAnswer: isCorrectAnswer,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
