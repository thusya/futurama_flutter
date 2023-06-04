class Question {
  final int id;
  final String question;
  final List<String> possibleAnswers;
  final String correctAnswer;

  Question({
    required this.id,
    required this.question,
    required this.possibleAnswers,
    required this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
      id: json["id"],
      question: json["question"],
      possibleAnswers: (json['possibleAnswers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      correctAnswer: json["correctAnswer"] is int
          ? json["correctAnswer"].toString()
          : json["correctAnswer"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "possibleAnswers": possibleAnswers,
        "correctAnswer": correctAnswer,
      };
}
