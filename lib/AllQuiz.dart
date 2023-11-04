import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled3/API/CallApi.dart';
import 'StartQuiz.dart';
import 'Widget .dart';

class AllQuiz extends StatefulWidget {
  const AllQuiz({super.key, required this.chapter});

  final chapter;

  @override
  State<AllQuiz> createState() => _AllQuizState();
}

class _AllQuizState extends State<AllQuiz> {
  var AllQuiz = [];
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllQuiz();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllBar(text: 'All Quiz'),
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
        child: Container(
          //Make listview Builder
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: AllQuiz.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  title: Text(
                    "${AllQuiz[index]['name']}",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "${AllQuiz[index]['description']}",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StartQuiz( quiz: AllQuiz[index]),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> getAllQuiz() async {
    final response =
        await CallApi().getData('chapter/${widget.chapter['id']}/quiz');
    print(response.body);
    var body = json.decode(response.body);
    for (var i = 0; i < body['data'].length; i++) {
      AllQuiz = body['data'];
    }

    setState(() {
      AllQuiz = AllQuiz;
    });
    print(body['data']);
  }
}
