import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trivia_app/models/quiz_model.dart';

class ApiManager {
  Future<QuizModel> getQuestion() async {
    var client = http.Client();

    var questions;

    try {
      var response =
          await client.get(Uri.parse('https://opentdb.com/api.php?amount=10'));
      if (response.statusCode == 200) {
        var jsonData = response.body;
        var result = json.decode(jsonData);

        questions = QuizModel.fromJson(result);
        print(questions);
      }

    } catch (e) {
      throw Exception(e);
    } finally {
      client.close();
    }
    return questions;
  }
}
