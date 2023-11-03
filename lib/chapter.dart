import 'package:flutter/material.dart';
import 'package:untitled3/API/CallApi.dart';
import 'package:untitled3/Quiz.dart';

import 'Widget .dart';

class Chapter extends StatefulWidget {

  Chapter({Key? key, required this.subject});
  //get the value of the subject passed throuh the constructors
  final subject;


  @override
  State<Chapter> createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllBar(text: "Chapter ${widget.subject['name']}"), // Your custom Widget
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Image/BackGround.jpg'), // Make sure the path is correct
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
                    'Chapter 1',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Quiz(),
                      ),
                    );
                  },
                ),
                // Add more Card and ListTile widgets for additional chapters
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void>getChapter () async{
  final respnse = await CallApi().getData('chapter');
  print("respnse");
}