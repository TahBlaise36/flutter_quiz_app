import 'package:flutter/material.dart';
import 'package:quiz_app/components/text_styles.dart';

class MainButton extends StatelessWidget {
  const MainButton(
    this.action, {
    super.key,
    // this.isChecked = false,
    this.buttonText = 'Next',
    this.color = const Color.fromARGB(255, 124, 141, 249),
    this.textColor = Colors.white,
    this.hasAnswered = true,
    this.borderRadius = 100,
  });

  final void Function() action;
  // final bool isChecked;
  final String buttonText;
  final Color color;
  final Color textColor;
  final bool hasAnswered;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    String text = buttonText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: hasAnswered ? action : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: textColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(color: textColor, width: 0),
            ),
            padding: const EdgeInsets.all(22.0),
          ),
          child: TextStyles(
            text,
            color: textColor,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
