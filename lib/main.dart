import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/login.dart';
import 'Dashboard.dart';
import 'LearningMaterial.dart';
import 'Widget .dart';
import 'chapter.dart';
import 'homepage.dart';
import 'signup.dart';
import 'subject.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Dashboard(),
      theme: ThemeData(
        actionIconTheme: ActionIconThemeData(
          backButtonIconBuilder: (context) => Icon(Icons.arrow_back_ios,color: Colors.white,),

        ),
        primarySwatch: Colors.green,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green),
      ),

    );
  }
}
