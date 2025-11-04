import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

// Import pages
import 'pages/name_input_page.dart';
import 'pages/quiz_page.dart';
import 'pages/result_page.dart';
import 'pages/review_page.dart';
import 'pages/start_page.dart';

// Import state
import 'state/quiz_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => QuizState()),
      ],
      child: MaterialApp(
        title: 'Quiz App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.spaceGroteskTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const StartPage(),
          '/name': (context) => const NameInputPage(),
          '/quiz': (context) => const QuizPage(),
          '/result': (context) => const ResultPage(),
          '/review': (context) => const ReviewPage(),
        },
      ),
    );
  }
}

