import 'package:flutter/material.dart';
import 'package:quiz_app/data/Quiz_levels.dart';
import 'package:quiz_app/pages/level_page.dart';
import 'package:quiz_app/pages/onboarding_page.dart';
import 'package:quiz_app/pages/questions_page.dart';
import 'package:quiz_app/pages/result_page.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  var currentQuestionIndex = 0;
  var level = 0;
  bool isClicked = false;
  double score = 0;
  int points = 10;
  String user = 'Adam Smith';

  var activeScreen = "onboarding_page";

  void switchToOnboardingPage() {
    setState(() {
      activeScreen = "onboarding_page";
    });
  }

  void switchToLevelPage() {
    setState(() {
      activeScreen = "level_page";
    });
  }

  void switchToQuestionPage() {
    setState(() {
      activeScreen = "questions_page";
    });
  }

  void switchQuestion() {
    setState(() {
      if (currentQuestionIndex == allQuestions[level].length - 1) {
        // print('Quiz completed');
        activeScreen = "results_page";
      } else {
        currentQuestionIndex++;
      }
    });
  }

  void updateScore(double newScore) {
    setState(() {
      score = newScore;
    });
  }

  void restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
    });
  }

  void resetAnswerState() {
    setState(() {
      isClicked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    late Widget screenWidget;

    switch (activeScreen) {
      case "onboarding_page":
        screenWidget = OnboardingPage(switchToLevelPage);
        break;
      case "level_page":
        screenWidget = LevelPage(
          switchToQuestionPage,
          user: user,
          level: level,
        );
        break;
      case "questions_page":
        screenWidget = QuestionsPage(
          switchQuestion: () {
            switchQuestion();
            resetAnswerState();
          },
          updateScore: updateScore,
          level: level,
          currentQuestionIndex: currentQuestionIndex,
          points: points,
          score: score,
          user: user,
        );
        break;
      case "results_page":
        screenWidget = ResultsPage(
          () {
            switchToQuestionPage();
            restartQuiz();
          },
          () {
            switchToOnboardingPage();
            restartQuiz();
          },
          points: points,
          score: score,
          level: level,
          currentQuestionIndex: currentQuestionIndex,
        );
        break;
      default:
        screenWidget = OnboardingPage(switchToQuestionPage);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/images/quiz_bg2.png'),
              fit: BoxFit.cover,
            ),
            // gradient: LinearGradient(
            //   colors: [
            //     Color.fromARGB(255, 124, 141, 249),
            //     Color.fromARGB(255, 105, 13, 179)
            //   ],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            // ),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: screenWidget,
          ),
        ),
      ),
    );
  }
}
