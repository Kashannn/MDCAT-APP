import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'LearningMaterial.dart';
import 'homepage.dart';
import 'subject.dart';

Widget InputField({
  required String hintText,
  required String labelText,
  required TextEditingController controller,
  TextInputType? keyboardType,
  FormFieldValidator<String>? validator,
  bool? obscureText,
}) {
  return TextFormField(
    controller: controller,
    validator: validator,
    obscureText: obscureText ?? false,
    decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
  );
}

Widget portion(BuildContext context, double height, double width, Color color,
    WidgetRef ref) {
  return Container(
    height: height,
    width: width,
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade500,
          offset: Offset(4.0, 4.0),
          blurRadius: 15.0,
          spreadRadius: 1.0,
        ),
        BoxShadow(
          color: Colors.white,
          offset: Offset(-4.0, -4.0),
          blurRadius: 15.0,
          spreadRadius: 2.0,
        ),
      ],
      color: color, // Set the provided color
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        button(
            text: 'Subject',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Subject()),
              );
            }),
        button(text: 'All Quiz', onPressed: () {}),
      ],
    ),
  );
}

Widget button({
  required String text,
  required VoidCallback onPressed,
}) {
  return Container(
    margin: EdgeInsets.all(10),
    width: 450,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.green, // Change the color to your desired color
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '$text',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget CustomCard({
  required String text,
  required BuildContext context,
  VoidCallback? onpressed,
}) {
  return GestureDetector(
    onTap: () {
      onpressed!();
    },
    child: Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: Offset(4.0, 4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-4.0, -4.0),
            blurRadius: 15.0,
            spreadRadius: 2.0,
          ),
        ],
        color: Colors.green, // Set the provided color
      ),
      child: Center(
        child: Text(
          '$text',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

Widget squareCard(BuildContext context,String text) {
  return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width * 0.45,
      child: GestureDetector(
        onTap: () {
          print('Grade Students');
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star_border_outlined,
                size: 50,
                color: Colors.blue,
              ),
              Text(
                '$text',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ));
}
Widget AllBar({
  required String text,
}){
  return Scaffold(appBar: AppBar(
    title: Text(
      '$text',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.green,
    foregroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(15),
      ),
    ),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.blue, Colors.green],
        ),
      ),
    ),
  ),);
}