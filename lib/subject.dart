import 'package:flutter/material.dart';
import 'package:untitled3/chapter.dart';
import 'Widget .dart';
import 'homepage.dart';

class Subject extends StatefulWidget {
  const Subject({Key? key}) : super(key: key);

  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight = screenHeight * 0.20; // Adjust the factor as needed

    return Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: imageHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('Image/Subject.png'), // Replace with your image path
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              CustomCard(
                text: 'English',
                context: context,
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  Chapter(),
                    ),
                  );
                },

              ),
              CustomCard(
                text: 'Physics',
                context: context,
                onpressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Chapter(),
                  ),
                  );
                },
              ),
              CustomCard(
                text: 'Chemistry',
                context: context,
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Chapter(),
                    ),
                  );
                },
              ),
              CustomCard(
                text: 'Biology',
                context: context,
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  Chapter(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
  }
}
