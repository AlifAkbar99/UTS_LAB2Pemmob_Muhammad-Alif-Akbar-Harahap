import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  void _navigateToNameInput(BuildContext context) {
    Navigator.pushNamed(context, '/name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton(
          text: 'Start the Quiz',
          onPressed: () => _navigateToNameInput(context),
        ),
      ),
    );
  }
}