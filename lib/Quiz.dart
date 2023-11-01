import 'package:flutter/material.dart';
import 'LearningMaterial.dart';
import 'Widget .dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AllBar(text: 'Quiz'),
        // Your custom Widget
      ),
      body: Center(
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
                  'Start Quiz',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Add your onTap logic here
                },
              ),
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                title: Text('Learning Material',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LearningMaterial(),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
