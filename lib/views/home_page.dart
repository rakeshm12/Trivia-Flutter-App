import 'package:flutter/material.dart';
import 'package:trivia_app/views/quiz_page.dart';
import 'package:trivia_app/views/widgets/button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'TRIVIA APP',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50.0),
              CustomButton(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuizPage(),
                  ),
                ),
                text: 'TAKE TRIVIA',
                textColor: Colors.blue.shade800,
                width: 150,
                buttonColor: Colors.yellow.shade700,
                icon: Icons.arrow_forward,
                iconColor: Colors.blue.shade800,
                textPadding: const EdgeInsets.only(left: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
