import 'package:flutter/material.dart';

import 'Widget .dart'; // Assuming you have a valid import for the AnimatedButton

class StartQuiz extends StatefulWidget {
  const StartQuiz({Key? key}) : super(key: key);

  @override
  _StartQuizState createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllBar(text: 'Quiz'),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: ListView(
            padding: EdgeInsets.all(5),
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
                  subtitle: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildRadioOption(0, 'Option 1'),
                        buildRadioOption(1, 'Option 2'),
                        buildRadioOption(2, 'Option 3'),
                        buildRadioOption(3, 'Option 4'),
                      ],
                    ),
                  ),
                ),
              ),
              AnimatedButton(text: 'SAVE'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRadioOption(int value, String label) {
    return ListTile(
      leading: Radio(
        fillColor: MaterialStateProperty.all(Colors.green),
        value: value,
        groupValue: selectedOption,
        onChanged: (value) {
          setState(() {
            selectedOption = value;
          });
        },
      ),
      title: Text(label),
    );
  }
}
