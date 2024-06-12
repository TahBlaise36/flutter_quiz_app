import 'package:flutter/material.dart';
import 'package:quiz_app/components/text_styles.dart';
import 'package:quiz_app/constanst/colors.dart';
import 'package:quiz_app/data/Quiz_levels.dart';

class ResultsBox extends StatelessWidget {
  const ResultsBox({
    super.key,
    required this.points,
    required this.score,
    required this.level,
    required this.currentQuestionIndex,
    // required this.name,
  });
  final int points;
  final double score;
  final int level;
  final int currentQuestionIndex;
  // final String name;
  // final int index;

  String getComment(double score) {
    var comment = "";
    if (score < 50) {
      comment = "Oops try again";
    } else if (score < 60) {
      comment = "Good";
    } else if (score < 80) {
      comment = "Very Good";
    } else {
      comment = "Excellent";
    }
    return comment;
  }

  @override
  Widget build(BuildContext context) {
    var imageUrl = score < 50
        ? 'lib/images/crying.png'
        : score < 80
            ? 'lib/images/thumbs-up.png'
            : 'lib/images/trophy.png';
    var numQuestions = allQuestions[level].length;
    // var questionsPoints = numQuestions * points;
    var correct = score / points;
    var wrong = numQuestions - correct;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Transform.translate(
        offset: const Offset(0, -60.0),
        child: Stack(
          children: [
            // The main container
            Container(
              width:
                  double.infinity, // Takes full width of its parent container
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 35),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align the "1." text to the top
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .center, // Align the text to the left
                      children: [
                        TextStyles(getComment(score),
                            color: mainColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "You've scrored ",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: textColor,
                                ),
                              ),
                              TextSpan(
                                text: "$score",
                                style:
                                    TextStyle(fontSize: 18, color: accentColor),
                              ),
                              TextSpan(
                                text: " points",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: textColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: mainColor,
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          Icons.add,
                                          color: white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "$numQuestions",
                                        style: TextStyle(
                                            color: mainColor,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "Total questions",
                                    style: TextStyle(color: textColor),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: successColor,
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          Icons.check,
                                          color: white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "$correct",
                                        style: TextStyle(
                                            color: successColor,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "Correct",
                                    style: TextStyle(color: textColor),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: dangerColor,
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          Icons.clear,
                                          color: white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "$wrong",
                                        style: TextStyle(
                                            color: dangerColor,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "Wrong",
                                    style: TextStyle(color: textColor),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // The circular container
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Transform.translate(
                offset: const Offset(
                    0, -75.0), // Move the circular container up by 28.0 points
                child: Center(
                  child: SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: Image.asset(imageUrl),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// color: const Color.fromARGB(255, 0, 127, 255),