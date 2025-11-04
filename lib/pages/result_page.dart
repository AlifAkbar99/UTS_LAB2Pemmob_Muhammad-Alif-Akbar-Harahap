import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/quiz_state.dart';
import '../widgets/custom_button.dart';
import 'review_page.dart';
import 'start_page.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizState = Provider.of<QuizState>(context);
    final size = MediaQuery.of(context).size;
    final correctCount = quizState.getCorrectCount();
    final wrongCount = quizState.getWrongCount();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Excellent!',
              style: TextStyle(
                fontSize: size.width * 0.08,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              'This is your results, ${quizState.userName}',
              style: TextStyle(
                fontSize: size.width * 0.045,
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Icon(
              Icons.emoji_events,
              size: size.width * 0.3,
              color: Colors.amber,
            ),
            SizedBox(height: size.height * 0.04),
            Text(
              'Benar: $correctCount',
              style: TextStyle(
                fontFamily: 'Grotesk',
                fontSize: size.width * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Salah: $wrongCount',
              style: TextStyle(
                fontFamily: 'Grotesk',
                fontSize: size.width * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Container(),  // This will push the buttons to the bottom
            ),
            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.15), // Increased padding from 0.08 to 0.15
              child: Column(
                children: [
                  CustomButton(
                    text: 'Result',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ReviewPage(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: size.height * 0.02),
                  CustomButton(
                    text: 'Back to menu',
                    onPressed: () {
                      quizState.reset();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const StartPage()),
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}