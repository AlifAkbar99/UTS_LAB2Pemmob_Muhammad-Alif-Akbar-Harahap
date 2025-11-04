import 'package:flutter/foundation.dart';
import '../models/question.dart';

class QuizState extends ChangeNotifier {
  String userName = '';
  List<int?> userAnswers = List.filled(5, null);
  int currentQuestionIndex = 0;

  final List<Question> questions = [
    Question(
      id: 1,
      question: "Apa ibukota Indonesia",
      options: ["Jakarta", "Bandung", "Bekasi", "Medan"],
      correctAnswer: 0,
    ),
    Question(
      id: 2,
      question: "Framework apa yang di gunakan pada mobileapp",
      options: ["Java", "Kotlin", "Flutter", "Python"],
      correctAnswer: 2,
    ),
    Question(
      id: 3,
      question: "Siapa Presiden Indonesia pada tahun 1976?",
      options: ["Soekarno", "Soeharto", "Prabowo", "Jokowi"],
      correctAnswer: 1,
    ),
    Question(
      id: 4,
      question: "Malaysia menggunakan Bahasa apa?",
      options: ["Malay", "Bahasa Indonesia", "Tagalog", "Batak"],
      correctAnswer: 0,
    ),
    Question(
      id: 5,
      question: "Komet dengan kecepatan 500km/s disebut?",
      options: ["2024 YR4", "Schweizer", "2005 EZ223", "3I Atlas"],
      correctAnswer: 3,
    ),
  ];

  // Constructor tanpa required parameter
  QuizState([String? name]) {
    if (name != null) {
      userName = name;
    }
  }

  void setUserName(String name) {
    userName = name;
    notifyListeners();
  }

  void setAnswer(int questionIndex, int answerIndex) {
    userAnswers[questionIndex] = answerIndex;
    notifyListeners();
  }

  void setCurrentQuestion(int index) {
    currentQuestionIndex = index;
    notifyListeners();
  }

  int getCorrectCount() {
    int correct = 0;
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers[i] == questions[i].correctAnswer) {
        correct++;
      }
    }
    return correct;
  }

  int getWrongCount() {
    return questions.length - getCorrectCount();
  }

  void reset() {
    userName = '';
    userAnswers = List.filled(5, null);
    currentQuestionIndex = 0;
    notifyListeners();
  }
}