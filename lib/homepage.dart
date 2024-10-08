import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/main.dart';
import 'Widget .dart';
import 'subject.dart';
import 'login.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return  Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('Image/BackGround.jpg'), // Replace with your image path
          fit: BoxFit.fill,
        ),
      ),
      child: SingleChildScrollView(
          child: Row(
            children: [
              // portion(context,200, 500, Colors.white38,ref),
              squareCard(context,'Grade'),
              squareCard(context,'Exam'),

            ],
          ),
      ),
    );
  }
}
