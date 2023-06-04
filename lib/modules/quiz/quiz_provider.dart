import 'dart:convert';
import 'package:futurama/data/futurama_question.dart';
import 'package:futurama/modules/quiz/results_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class QuizProvider with ChangeNotifier {
  List<Question>? questions;
  bool isLoading = true;
  String? error;

  bool get hasError => error != null && error!.isNotEmpty;
  bool get hasData => questions != null && questions!.isNotEmpty;

  int currentQuestionIndex = 0;
  int? currentSelectedAnswerIndex;
  int score = 0;

  bool get isAnswered => currentSelectedAnswerIndex != null;

  QuizProvider() {
    fetchQuiz();
  }

  Question get currentQuestion => questions![currentQuestionIndex];

  Future<void> fetchQuiz() async {
    final response = await http
        .get(Uri.parse('https://api.sampleapis.com/futurama/questions'));

    if (response.statusCode == 200) {
      questions = (json.decode(response.body) as List<dynamic>)
          .map((data) => Question.fromJson(data))
          .toList();
      notifyListeners();
    } else {
      error = 'Failed to fetch questions';
    }
    isLoading = false;
  }

  void submitAnswer(Function? onComplete) {
    final currentQuestion = questions![currentQuestionIndex];
    final selectedAnswer =
        currentQuestion.possibleAnswers[currentSelectedAnswerIndex!];
    if (selectedAnswer == currentQuestion.correctAnswer) {
      score++;
      notifyListeners();
    }

    currentSelectedAnswerIndex = null;

    if (currentQuestionIndex < questions!.length - 1) {
      currentQuestionIndex++;
      notifyListeners();
    } else {
      onComplete?.call();
    }
  }

  void onComplete(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ResultsScreen(score: score, totalQuestions: questions!.length),
      ),
    );
  }

  void selectAnswer(int index) {
    currentSelectedAnswerIndex = index;
    notifyListeners();
  }

  void restart() {
    score = 0;
    currentQuestionIndex = 0;
    notifyListeners();
  }
}
