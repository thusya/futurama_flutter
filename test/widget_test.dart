import 'package:flutter_test/flutter_test.dart';
import 'package:futurama/data/futurama_question.dart';
import 'package:futurama/modules/quiz/quiz_provider.dart';

void main() {
  group('QuizProvider', () {
    test('Fetches questions and initializes state correctly', () async {
      // Arrange
      final quizProvider = QuizProvider();

      // Act
      // quizProvider.fetchQuiz();

      // Assert
      expect(quizProvider.questions, null);
      expect(quizProvider.isLoading, true);

      // Wait for the data to be fetched
      await Future.delayed(const Duration(seconds: 5));

      // Assert
      expect(quizProvider.questions, isNotEmpty);
      expect(quizProvider.isLoading, false);
    });

    test('Checks if the user-selected answer is correct', () {
      // Arrange
      final quizProvider = QuizProvider();
      final question = Question(
        id: 1,
        question: 'What is Fry\'s first name?',
        possibleAnswers: ['Fred', 'Philip', 'Will', 'John'],
        correctAnswer: 'Philip',
      );

      // Act
      quizProvider.questions = [question];
      quizProvider.selectAnswer(1);
      quizProvider.submitAnswer(null);

      // Assert
      expect(quizProvider.score, 1);
    });

    test('Resets quiz state', () {
      // Arrange
      final quizProvider = QuizProvider();
      final question = Question(
        id: 1,
        question: 'What is Fry\'s first name?',
        possibleAnswers: ['Fred', 'Philip', 'Will', 'John'],
        correctAnswer: 'Philip',
      );

      quizProvider.questions = [question];
      quizProvider.selectAnswer(1);
      quizProvider.submitAnswer(null);

      // Act
      quizProvider.restart();

      // Assert
      expect(quizProvider.score, 0);
    });
  });
}
