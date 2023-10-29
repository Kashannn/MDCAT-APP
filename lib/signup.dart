import 'package:flutter/material.dart';
import 'Widget .dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.all(20),
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
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'Image/logo.png',
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  InputField(
                    hintText: 'Name ',
                    labelText: 'Name',
                    controller: nameController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InputField(
                    hintText: 'Enter Email',
                    labelText: 'Email',
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InputField(
                    hintText: 'Enter Password',
                    labelText: 'Password',
                    controller: passwordController,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InputField(
                    hintText: 'Confirm Password',
                    labelText: 'Confirm Password',
                    controller: confirmController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InputField(
                    hintText: 'phone number',
                    labelText: 'phone number',
                    controller: phoneController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Sign Up'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
