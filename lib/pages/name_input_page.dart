import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/quiz_state.dart';
import '../widgets/custom_button.dart';

class NameInputPage extends StatefulWidget {
  const NameInputPage({Key? key}) : super(key: key);

  @override
  State<NameInputPage> createState() => _NameInputPageState();
}

class _NameInputPageState extends State<NameInputPage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _submitName() {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your name'),
        ),
      );
      return;
    }

    final quizState = Provider.of<QuizState>(context, listen: false);
    quizState.setUserName(_nameController.text.trim());

    Navigator.pushNamed(context, '/quiz');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'What\'s your name?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'Continue',
                onPressed: _submitName,
              ),
            ],
          ),
        ),
      ),
    );
  }
}