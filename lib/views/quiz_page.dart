import 'package:flutter/material.dart';
import 'package:trivia_app/api_data/api_manager.dart';
import 'package:trivia_app/models/quiz_model.dart';
import 'package:trivia_app/views/result_page.dart';
import 'package:trivia_app/views/widgets/button_widget.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late Future<QuizModel> results;
  int currentIndex = 0;
  final Map<int, dynamic> answers = {};

  @override
  void initState() {
    results = ApiManager().getQuestion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TRIVIA APP'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: FutureBuilder<QuizModel>(
              future: results,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong'));
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        final result = snapshot.data!.results[index];
                        if (!result.incorrectAnswers
                            .contains(result.correctAnswer)) {
                          result.incorrectAnswers.add(result.correctAnswer);
                          result.incorrectAnswers.shuffle();
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Text(
                              'Question ${currentIndex + 1}',
                              style: TextStyle(color: Colors.blue.shade800),
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              result.question,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 30),
                            Text(
                              'Choices',
                              style: TextStyle(color: Colors.blue.shade800),
                            ),
                            Column(
                              children: [
                                ...result.incorrectAnswers.map(
                                  (e) => RadioListTile(
                                      title: Text(e.toString()),
                                      value: e.toString(),
                                      groupValue: answers[currentIndex],
                                      onChanged: (newValue) {
                                        setState(() {
                                          answers[currentIndex] = newValue;
                                        });
                                      }),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomButton(
                                    onTap: () {
                                      if (result
                                          .question[currentIndex].isEmpty) {
                                        return;
                                      } else if (currentIndex <
                                          result.question.length - 1) {
                                        setState(() {
                                          currentIndex++;
                                        });
                                      } else {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ResultPage()),
                                        );
                                      }
                                    },
                                    text: 'Next',
                                    textColor: Colors.blue.shade800,
                                    width: 100,
                                    buttonColor: Colors.yellow.shade700,
                                    icon: Icons.arrow_forward,
                                    iconColor: Colors.blue.shade800,
                                    textPadding:
                                        const EdgeInsets.only(left: 20),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      });
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }
}
