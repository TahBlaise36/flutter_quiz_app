import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/components/level_tile.dart';
import 'package:quiz_app/constanst/colors.dart';
import 'package:quiz_app/components/main_button.dart';
import 'package:quiz_app/data/Quiz_levels.dart';
import 'package:quiz_app/pages/questions_page.dart';

class LevelPage extends StatefulWidget {
  LevelPage(
    this.switchToQuestionPage, {
    super.key,
    required this.user,
    required this.level,
  });

  final String user;
  int level;
  final void Function() switchToQuestionPage;

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  String get user => widget.user;
  int get level => widget.level;
  Function() get switchToQuestionPage => widget.switchToQuestionPage;

  void switchLevel(int index) {
    setState(() {
      widget.level = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    // Desired height is 75% of the screen height
    final double desiredHeight = screenHeight * 0.75;

    const List<List<Color>> colors = [
      [Color.fromARGB(255, 105, 13, 179), Color.fromARGB(255, 124, 149, 249)],
      [Color.fromARGB(255, 247, 157, 1), Color.fromARGB(255, 245, 71, 51)],
      [Color.fromARGB(255, 154, 66, 226), Color.fromARGB(255, 124, 149, 249)],
      [Color.fromARGB(255, 247, 97, 97), Color.fromARGB(255, 133, 156, 245)],
    ];

    // var title = allQuestions[level][currentQuestionIndex].title;
    var numLevel = allQuestions.length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30, right: 30, left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome $user!",
                    style: GoogleFonts.dmSerifDisplay(
                        fontSize: 25,
                        color: white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Choose level",
                    style: GoogleFonts.dmSerifDisplay(
                        fontSize: 25,
                        color: white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Select an option below to start the quiz",
                    style: TextStyle(fontSize: 16, color: accentColor),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          height: desiredHeight,
          padding: const EdgeInsets.only(right: 30, bottom: 30, left: 30),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 247, 249, 249),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  ...allQuestions.asMap().entries.map(
                    (entry) {
                      int index = entry.key;
                      // String answer = entry.value;
                      return GestureDetector(
                        onTap: () {
                          switchLevel(index);
                        },
                        child: LevelTile(
                          num: index + 1,
                          gradient: colors[index],
                        ),
                      );
                    },
                  ),
                ],
              ),
              // Button to switch to the next question
              MainButton(
                () => switchToQuestionPage(),
                color: mainColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// getAnswerButtonStyle(answer, correctAnswer, index);