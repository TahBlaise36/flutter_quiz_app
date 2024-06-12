import 'package:flutter/material.dart';
import 'package:quiz_app/components/main_button.dart';
import 'package:quiz_app/components/results_box.dart';
import 'package:quiz_app/components/text_styles.dart';
import 'package:quiz_app/constanst/colors.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
    this.switchToQuestionPage,
    this.switchToOnboardingPage, {
    super.key,
    required this.points,
    required this.score,
    required this.level,
    required this.currentQuestionIndex,
  });

  final void Function() switchToQuestionPage;
  final void Function() switchToOnboardingPage;
  final int points;
  final double score;
  final int level;
  final int currentQuestionIndex;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double desiredHeight = screenHeight * 0.6; // 80%

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50, right: 30, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      TextStyles(
                        'Quiz',
                        color: white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      // Add some spacing between the elements
                      TextStyles(
                        'Summary',
                        color: accentColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          height: desiredHeight,
          padding: const EdgeInsets.only(right: 30, bottom: 30, left: 30),
          decoration: BoxDecoration(
              color: white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ResultsBox(
                    points: points,
                    score: score,
                    level: level,
                    currentQuestionIndex: currentQuestionIndex,
                  ),
                ],
              ),
              Column(
                children: [
                  MainButton(
                    () => switchToOnboardingPage(),
                    buttonText: 'Quit Quiz',
                    textColor: mainColor,
                    color: white,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MainButton(
                    () => switchToQuestionPage(),
                    buttonText: 'Restart',
                    color: mainColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
