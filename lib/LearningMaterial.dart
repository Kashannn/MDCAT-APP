import 'package:flutter/material.dart';
import 'package:untitled3/Widget%20.dart';

class LearningMaterial extends StatefulWidget {
  const LearningMaterial({super.key});

  @override
  State<LearningMaterial> createState() => _LearningMaterialState();
}

class _LearningMaterialState extends State<LearningMaterial> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: question(),

      );
  }
}
