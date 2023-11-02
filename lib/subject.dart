import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:untitled3/API/CallApi.dart';
import 'package:untitled3/chapter.dart';
import 'Widget .dart';
import 'homepage.dart';

class Subject extends StatefulWidget {
  const Subject({Key? key}) : super(key: key);

  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  var subjects = [];
  var loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSubjects();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight = screenHeight * 0.2; // Adjust the factor as needed

    return Center(
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: imageHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Image/Subject.png'),
                // Replace with your image path
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          loading
              ? const CircularProgressIndicator()
              : ListView.builder(
                  padding: const EdgeInsets.all(8),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: subjects.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomCard(
                        text: subjects[index]['name'],
                        context: context,
                        onpressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Chapter(subject: subjects[index])),
                          );
                        });
                  },
                ),
        ]),
      ),
    );
  }

  Future<void> getSubjects() async {
    setState(() {
      loading = true;
    });
    final response = await CallApi().getData('subjects');
    print("response");
    //json
    var data = json.decode(response.body);

    print(data['data']);
    for (var i = 0; i < data['data'].length; i++) {
      subjects = data['data'];
    }
    setState(() {
      loading = false;
    });
  }
}
