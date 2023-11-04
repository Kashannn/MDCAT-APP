import 'package:flutter/material.dart';
import 'package:untitled3/StartQuiz.dart';
import 'AllQuiz.dart';
import 'LearningMaterial.dart';
import 'Widget .dart';

class Quiz extends StatefulWidget {

  final chapter;
  Quiz({super.key, required this.chapter});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AllBar(text: 'Quiz'),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('Image/BackGround.jpg'),
              // Make sure the path is correct
              fit: BoxFit.fill,
            ),
          ),
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
                      'All Quiz ${widget.chapter['name']}',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AllQuiz( chapter: widget.chapter ),
                          ));
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
        ));
  }
}
