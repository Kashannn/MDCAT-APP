import 'package:flutter/material.dart';
import 'package:untitled3/Quiz.dart';
import 'Widget .dart'; // Import your custom Widget here

class Chapter extends StatefulWidget {
  const Chapter({Key? key});

  @override
  State<Chapter> createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AllBar(text: 'Chapter'), // Your custom Widget
        ),
        //body here and it contain chapter list
        body: Center(
            child: ListView(padding: EdgeInsets.all(16), children: [
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
                    ));
              },
            ),
          ),
        ])));
  }
}
