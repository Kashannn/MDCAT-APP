import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled3/API/CallApi.dart';
import 'package:untitled3/Quiz.dart';

import 'Widget .dart';

class Chapter extends StatefulWidget {
  Chapter({Key? key, required this.subject});

  final subject;

  @override
  State<Chapter> createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> {
  var AllChapter = [];

  @override
  initState() {
    super.initState();
    getChapter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllBar(text: "Chapter ${widget.subject['name']}"),
      // Your custom Widget
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
            child: ListView.builder(
          padding: const EdgeInsets.all(8),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: AllChapter.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                title: Text(
                  "${AllChapter[index]['name']}",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Quiz(
                        chapter: AllChapter[index],

                      ),
                    ),
                  );
                },
              ),
            );
          },
        )),
      ),
    );
  }

  Future<void> getChapter() async {
    final respnse = await CallApi().getData('chapters/${widget.subject['id']}');
    print(respnse.body);
    var data = json.decode(respnse.body);
    print(data['data']);
    for (var i = 0; i < data['data'].length; i++) {
      AllChapter = data['data'];
    }
    setState(() {
      AllChapter = AllChapter;
    });
    print(AllChapter.length);
  }
}
