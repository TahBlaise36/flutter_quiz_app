class QuizQuestion {
  const QuizQuestion(this.title, this.answer, this.answers);

  final String title;
  final String answer;
  final List<String> answers;

  // List<String> getShuffledAnswers() {
  //   final shuffledList = List.of(answers);
  //   shuffledList.shuffle();
  //   return shuffledList;
  // }
}
