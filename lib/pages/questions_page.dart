import 'package:flutter/material.dart';
import 'package:quiz_app/constanst/colors.dart';
import 'package:quiz_app/components/answer_button.dart';
import 'package:quiz_app/components/main_button.dart';
import 'package:quiz_app/components/question_box.dart';
import 'package:quiz_app/components/text_styles.dart';
import 'package:quiz_app/components/countdown_timer.dart';
import 'package:quiz_app/data/Quiz_levels.dart';

class QuestionsPage extends StatefulWidget {
  QuestionsPage({
    super.key,
    required this.level,
    required this.currentQuestionIndex,
    required this.switchQuestion,
    required this.updateScore,
    required this.points,
    required this.score,
    required this.user,
    // required this.isSelectedAnswerButton,
  });

  final void Function()
      switchQuestion; // Callback to switch to the next question
  final void Function(double)
      updateScore; // New callback for updating the score
  final int level; // Index of the current question
  final int currentQuestionIndex; // Index of the current question
  final int points; // Index of the current question
  final String user; // Index of the current question
  double score;

  @override
  State<QuestionsPage> createState() => _QuestionsPage();
}

class _QuestionsPage extends State<QuestionsPage> {
  int get level => widget.level;
  // Getter to access the current question index from the widget
  int get currentQuestionIndex => widget.currentQuestionIndex;
  int get points => widget.points;
  String get user => widget.user;
  // int get score => widget.score;
  double get score => _score;
  // Getter to access the switch question function from the widget
  Function get switchQuestion => widget.switchQuestion;
  Function get updateScore =>
      widget.updateScore; // New getter for the updateScore callback

  int? selectedAnswerIndex; // Index of the selected answer
  bool isAnswerCorrect =
      false; // Boolean to check if the selected answer is correct
  double _score = 0;

  bool hasAnswered = false; // Flag to track if an answer has been clicked

  void setScore(bool isAnswerCorrect) {
    if (isAnswerCorrect) {
      setState(() {
        _score += points; // Increment the score by 10 points
        widget.score = _score; // Update the score in the QuestionsPage widget
        updateScore(_score);
      });
    }
  }

  // Method to handle button click and set the selected answer
  void setButtonClicked(int index, String answer) {
    if (!hasAnswered) {
      setState(() {
        selectedAnswerIndex = index;
        // Check if the selected answer matches the correct answer

        isAnswerCorrect =
            answer == allQuestions[level][currentQuestionIndex].answer;
        setScore(isAnswerCorrect);
        hasAnswered = true; // Mark that an answer has been clicked
      });
    }
  }

  @override
  void didUpdateWidget(covariant QuestionsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reset the state when the question index changes
    if (oldWidget.currentQuestionIndex != widget.currentQuestionIndex) {
      setState(() {
        selectedAnswerIndex = null;
        isAnswerCorrect = false;
        hasAnswered = false; // Reset the flag for the new question
      });
    }
  }

  void _onTimerEnd() {
    // Handle timer end logic, e.g., auto switch to the next question
    switchQuestion();
  }

  @override
  Widget build(context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    // Desired height is 75% of the screen height
    final double desiredHeight = screenHeight * 0.75;

    var questionNumber = currentQuestionIndex + 1;
    var numberOfQuestions = allQuestions[level].length;

// Ensure currentQuestionIndex is within range
    assert(
        currentQuestionIndex >= 0 && currentQuestionIndex < numberOfQuestions);

    var title = allQuestions[level][currentQuestionIndex].title;
    var answerList = allQuestions[level][currentQuestionIndex].answers;
    var correctAnswer = allQuestions[level][currentQuestionIndex].answer;
    var currentLevel = level + 1;

    // Method to get the styled answer button
    Widget getAnswerButtonStyle(
        String answer, String correctAnswer, int index) {
      bool isSelectedAnswerButton = selectedAnswerIndex == index;
      bool isCorrectAnswer = answer == correctAnswer;
      bool shouldHighlight =
          isSelectedAnswerButton || (hasAnswered && isCorrectAnswer);

      var answersArray = ['A', 'B', 'C', 'D'];
      String letter = answersArray[index];
      String answerText = '$letter. $answer';

      Color color;
      Color backgroundColor;

      if (shouldHighlight) {
        if (isCorrectAnswer) {
          color = white;
          backgroundColor = mainColor;
        } else {
          color = white;
          backgroundColor = dangerColor;
        }
      } else {
        color = mainColor;
        backgroundColor = white;
      }

      return AnswerButton(
        answerText: answerText,
        correctAnswer: correctAnswer,
        isCorrectAnswer: isCorrectAnswer,
        isSelectedAnswerButton: isSelectedAnswerButton,
        setButtonClicked: () {
          setButtonClicked(index, answer);
        },
        color: color,
        backgroundColor: backgroundColor,
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30, right: 30, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      TextStyles(
                        'Level',
                        color: white,
                      ),
                      // Add some spacing between the elements
                      TextStyles(
                        '$currentLevel',
                        color: accentColor,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextStyles(
                        'Name',
                        color: white,
                      ),
                      TextStyles(
                        user,
                        color: accentColor,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextStyles(
                        'Questions',
                        color: white,
                      ),
                      TextStyles(
                        '$questionNumber/$numberOfQuestions',
                        color: accentColor,
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
                  // Display the question
                  QuestionBox(
                    title: title,
                    index: questionNumber,
                    score: score,
                  ),

                  CountdownTimer(
                    key: ValueKey(currentQuestionIndex),
                    duration: 30, // Set the timer duration in seconds
                    onTimerEnd: _onTimerEnd, // Callback when timer ends
                  ),

                  ...answerList.asMap().entries.map((entry) {
                    int index = entry.key;
                    String answer = entry.value;
                    // print('Answer Index: $index, Answer: $answer');
                    return getAnswerButtonStyle(answer, correctAnswer, index);
                  }),
                ],
              ),
              // Button to switch to the next question
              MainButton(
                hasAnswered: hasAnswered,
                () => switchQuestion(),
                color: mainColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
