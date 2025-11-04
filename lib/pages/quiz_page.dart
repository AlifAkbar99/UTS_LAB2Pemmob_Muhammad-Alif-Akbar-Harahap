import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/quiz_state.dart';
import '../widgets/custom_button.dart';
import '../widgets/option_button.dart';
import 'result_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    final quizState = Provider.of<QuizState>(context);
    final size = MediaQuery.of(context).size;
    final question = quizState.questions[quizState.currentQuestionIndex];
    final labels = ['A', 'B', 'C', 'D'];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: quizState.currentQuestionIndex > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
                  quizState.setCurrentQuestion(
                    quizState.currentQuestionIndex - 1,
                  );
                },
              )
            : null,
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
                  (index) => OptionButton(
                    option: question.options[index],
                    label: labels[index],
                    onPressed: () {
                      quizState.setAnswer(
                        quizState.currentQuestionIndex,
                        index,
                      );
                      
                      // Automatically move to next question or finish
                      if (quizState.currentQuestionIndex < 4) {
                        quizState.setCurrentQuestion(
                          quizState.currentQuestionIndex + 1,
                        );
                      }
                    },
                    backgroundColor: quizState.userAnswers[
                        quizState.currentQuestionIndex] ==
                            index
                        ? const Color(0xFFE8E8E8)
                        : const Color(0xFFE8E8E8),
                  ),
                ),
              ),
            ),
            if (quizState.currentQuestionIndex == 4)
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.08),
                child: Center(
                  child: CustomButton(
                    text: 'Finish',
                    onPressed: () {
                      if (quizState.userAnswers[4] != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResultPage(),
                          ),
                        );
                      }
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