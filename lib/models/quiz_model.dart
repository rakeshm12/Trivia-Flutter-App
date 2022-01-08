import 'dart:convert';

QuizModel dbModelFromJson(String str) => QuizModel.fromJson(json.decode(str));

String dbModelToJson(QuizModel data) => json.encode(data.toJson());

class QuizModel {
  QuizModel({
    this.responseCode,
    required this.results,
  });

  final int? responseCode;
  final List<Result> results;

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        responseCode: json["response_code"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "response_code": responseCode,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.category,
    this.type,
    this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  final String? category;
  final Type? type;
  final Difficulty? difficulty;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        category: json["category"],
        type: typeValues.map[json["type"]],
        difficulty: difficultyValues.map[json["difficulty"]],
        question: json["question"],
        correctAnswer: json["correct_answer"],
        incorrectAnswers:
            List<String>.from(json["incorrect_answers"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "type": typeValues.reverse[type],
        "difficulty": difficultyValues.reverse[difficulty],
        "question": question,
        "correct_answer": correctAnswer,
        "incorrect_answers": List<dynamic>.from(incorrectAnswers.map((x) => x)),
      };
}

enum Difficulty { HARD, MEDIUM, EASY }

final difficultyValues = EnumValues({
  "easy": Difficulty.EASY,
  "hard": Difficulty.HARD,
  "medium": Difficulty.MEDIUM
});

enum Type { MULTIPLE, BOOLEAN }

final typeValues =
    EnumValues({"boolean": Type.BOOLEAN, "multiple": Type.MULTIPLE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap.isEmpty) {
      reverseMap = map.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}
