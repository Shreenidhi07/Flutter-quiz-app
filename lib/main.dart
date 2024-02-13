

import 'package:flutter/material.dart';

void main() => runApp(MyQuizApp());

class MyQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizScreen(),
    );
  }
}

class Question {
  final String question;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  List<Question> _questions = [
    Question(
      question: 'What is the capital of India?',
      options: ['Delhi', 'Maharashtra', 'Goa', 'Rajasthan'],
      correctAnswer: 'Delhi',
    ),
    Question(
      question: 'Who is the prime minister of India?',
      options: ['Narendra Modi', 'Stalin', 'Manmohan Singh', 'Jawaharlal Nehru'],
      correctAnswer: 'Narendra Modi',
    ),
    
    
    Question(
      question: 'What is the national flower of India?',
      options: ['Rose', 'Lotus', 'Lily', 'Jasmine'],
      correctAnswer: 'Lotus',
    ),
    
  ];

  void _checkAnswer(String selectedAnswer) {
    String correctAnswer = _questions[_currentQuestionIndex].correctAnswer;
    String feedback =
        selectedAnswer == correctAnswer ? 'Correct!' : 'Incorrect!';

    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(feedback),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
                _nextQuestion();
              },
              child: Text('Next Question'),
            ),
          ],
        );
      },
    );
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex =
          (_currentQuestionIndex + 1) % _questions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Quiz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              _questions[_currentQuestionIndex].question,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ..._questions[_currentQuestionIndex].options
                .map(
                  (option) => ElevatedButton(
                    onPressed: () {
                      _checkAnswer(option);
                    },
                    child: Text(option),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}

