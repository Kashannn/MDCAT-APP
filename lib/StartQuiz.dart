import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled3/AllQuiz.dart';

import 'API/CallApi.dart';
import 'Widget .dart';

class StartQuiz extends StatefulWidget {
  final quiz;

  const StartQuiz({Key? key, required this.quiz}) : super(key: key);

  @override
  _StartQuizState createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  List<Map<String, dynamic>> startQuiz = [];
  int currentQuestionIndex = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    startQuizQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllBar(text: 'Start Quiz'),
      body: Column(
        children: [
          if (isLoading)
          // Show a loading indicator at the center of the screen
            Center(
              child: CircularProgressIndicator(),
            )
          else if (startQuiz.isNotEmpty &&
              currentQuestionIndex < startQuiz.length)
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                title: Text(
                  "QNo:${currentQuestionIndex + 1} ${startQuiz[currentQuestionIndex]['question']}",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                subtitle: Column(
                  children: [
                    buildRadioOption(
                      currentQuestionIndex,
                      0,
                      '${startQuiz[currentQuestionIndex]['options'][0]['option']}',
                    ),
                    buildRadioOption(
                      currentQuestionIndex,
                      1,
                      '${startQuiz[currentQuestionIndex]['options'][1]['option']}',
                    ),
                    buildRadioOption(
                      currentQuestionIndex,
                      2,
                      '${startQuiz[currentQuestionIndex]['options'][2]['option']}',
                    ),
                    buildRadioOption(
                      currentQuestionIndex,
                      3,
                      '${startQuiz[currentQuestionIndex]['options'][3]['option']}',
                    ),
                  ],
                ),
              ),
            ),
          if (!isLoading)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedButton(
                  text: 'Previous',
                  onPressed: () {
                    setState(() {
                      currentQuestionIndex =
                          (currentQuestionIndex - 1).clamp(0, startQuiz.length - 1);
                    });
                  },
                ),
                AnimatedButton(
                  text: 'Next',
                  onPressed: () {
                    setState(() {
                      currentQuestionIndex =
                          (currentQuestionIndex + 1).clamp(0, startQuiz.length - 1);
                    });
                  },
                ),
              ],
            ),
          Spacer(),
          if (!isLoading)
          // Add some spacing between the buttons and the "Submit" button
            SizedBox(height: 16),
          if (!isLoading)
            AnimatedButton(
              text: 'Submit',
              onPressed: () {
                // Add your logic for handling the submit button press
              },
            ),
        ],
      ),
    );
  }

  Future<void> startQuizQuestions() async {
    final startTime = DateTime.now();
    final response =
    await CallApi().getData('quiz/${widget.quiz['id']}/questions');
    final endTime = DateTime.now();
    print(response.body);
    var body = json.decode(response.body);
    if (body['data'] is List) {
      setState(() {
        startQuiz = List<Map<String, dynamic>>.from(body['data']);
        isLoading = false;
      });
    }
    print(body['data']);
    print('Time taken: ${endTime.difference(startTime).inMilliseconds} ms');
  }

  Widget buildRadioOption(
      int questionIndex, int optionIndex, String label) {
    return ListTile(
      leading: Radio(
        fillColor: MaterialStateProperty.all(Colors.green),
        value: optionIndex,
        groupValue: startQuiz[questionIndex]['selectedOption'],
        onChanged: (value) {
          setState(() {
            startQuiz[questionIndex]['selectedOption'] = value;
          });
        },
      ),
      title: Text(label),
    );
  }
}
