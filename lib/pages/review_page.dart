import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/quiz_state.dart';
import '../widgets/custom_button.dart';
import '../widgets/option_button.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int currentReviewIndex = 0;

  @override
  Widget build(BuildContext context) {
    final quizState = Provider.of<QuizState>(context);
    final size = MediaQuery.of(context).size;
    final question = quizState.questions[currentReviewIndex];
    final labels = ['A', 'B', 'C', 'D'];
    final userAnswer = quizState.userAnswers[currentReviewIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: currentReviewIndex > 0
            ? IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            setState(() {
              currentReviewIndex--;
            });
          },
        )
            : IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${question.id}. ${question.question}',
              style: TextStyle(
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Expanded(
              child: Column(
                children: List.generate(
                  question.options.length,
                      (index) {
                    Color? bgColor;
                    Color? txtColor;

                    if (index == question.correctAnswer) {
                      bgColor = Colors.green[300];
                      txtColor = Colors.white;
                    } else if (index == userAnswer &&
                        userAnswer != question.correctAnswer) {
                      bgColor = Colors.red[300];
                      txtColor = Colors.white;
                    }

                    return OptionButton(
                      option: question.options[index],
                      label: labels[index],
                      onPressed: () {},
                      backgroundColor: bgColor,
                      textColor: txtColor,
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.08),
              child: Center(
                child: currentReviewIndex < 4
                    ? CustomButton(
                  text: 'Next',
                  onPressed: () {
                    setState(() {
                      currentReviewIndex++;
                    });
                  },
                )
                    : CustomButton(
                  text: 'Back to score',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
