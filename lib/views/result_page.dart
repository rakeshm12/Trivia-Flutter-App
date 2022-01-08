import 'package:flutter/material.dart';
import 'package:trivia_app/views/quiz_page.dart';
import 'package:trivia_app/views/widgets/button_widget.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key? key,
    required this.score,
  }) : super(key: key);
  final List<String> score;

  @override
  Widget build(BuildContext context) {
    // score.forEach((element) {
    //   element.allMatches(element);
    // });
    return Scaffold(
        appBar: AppBar(
          title: const Text('TRIVIA APP'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Your Score Is',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text('${(score.length * 10).toString()} / 100',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold)),
              CustomButton(
                  onTap: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuizPage(),
                      ),
                      (route) => false),
                  text: 'RETAKE TRIVIA',
                  width: 180,
                  buttonColor: Colors.yellow.shade800,
                  textPadding: const EdgeInsets.only(left: 12.0))
            ],
          ),
        ));
  }
}
