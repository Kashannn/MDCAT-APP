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
  int? selectedOption;
  var StartQuiz = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StarttQuiz();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllBar(text: 'Start Quiz'),
      body: SingleChildScrollView(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding:  EdgeInsets.all(8),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: StartQuiz.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                      title: Text(
                        "${StartQuiz[index]['question']}",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        children: [
                          buildRadioOption(0,
                              '${StartQuiz[index]['options'][0]['option']}'),
                          buildRadioOption(0,
                              '${StartQuiz[index]['options'][1]['option']}'),
                          buildRadioOption(0,
                              '${StartQuiz[index]['options'][2]['option']}'),
                          buildRadioOption(0,
                              '${StartQuiz[index]['options'][3]['option']}'),
                        ],
                      )),
                );
              },
            ),
        AnimatedButton(
          text: 'Submit',
        ),
          ],
        ),
      ),
    );
  }

  Future<void> StarttQuiz() async {
    final response =
        await CallApi().getData('quiz/${widget.quiz['id']}/questions');
    print(response.body);
    var body = json.decode(response.body);
    for (var i = 0; i < body['data'].length; i++) {
      StartQuiz = body['data'];
    }

    setState(() {
      StartQuiz = StartQuiz;
    });
    print(body['data']);
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
