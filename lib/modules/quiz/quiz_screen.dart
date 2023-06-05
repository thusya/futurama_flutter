import 'package:flutter/material.dart';
import 'package:futurama/modules/common/info_widget.dart';
import 'package:futurama/modules/quiz/quiz_provider.dart';

import 'package:provider/provider.dart';

class QuizScreen extends StatelessWidget {
  static const routeName = '/quiz';

  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(provider.hasData
            ? 'Quiz ${provider.currentQuestionIndex + 1}/${provider.questions!.length}'
            : 'Quiz'),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: provider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : provider.hasError
                  ? ErrorWidget(provider.error!)
                  : !provider.hasData
                      ? const InfoWidget(message: "No questions available")
                      : _buildQuestionPage(provider, context)),
    );
  }

  Widget _buildQuestionPage(QuizProvider provider, BuildContext context) {
    final currentQuestion = provider.currentQuestion;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  "Score:  ${provider.score}",
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              currentQuestion.question,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Column(
            children: List<Widget>.generate(
              currentQuestion.possibleAnswers.length,
              (optionIndex) => RadioListTile<int>(
                title: Text(currentQuestion.possibleAnswers[optionIndex]),
                value: optionIndex,
                groupValue: provider.currentSelectedAnswerIndex,
                onChanged: (value) {
                  provider.selectAnswer(optionIndex);
                },
              ),
            ),
          ),
          if (provider.isAnswered) const SizedBox(height: 16),
          if (provider.isAnswered)
            ElevatedButton(
              onPressed: () {
                provider.submitAnswer(() => provider.onComplete(context));
              },
              child: const Text('Submit'),
            ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
