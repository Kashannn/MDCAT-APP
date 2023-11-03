import 'package:flutter/material.dart';
import 'package:untitled3/Widget%20.dart';

class StartQuiz extends StatefulWidget {
  const StartQuiz({Key? key}) : super(key: key);

  @override
  _StartQuizState createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllBar(text: 'Quiz'),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  title: Text(
                    'Question 1',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  AnimatedButton(text: 'Save'),

                ],
              )],
          ),
        ),
      ),
    );
  }
}
