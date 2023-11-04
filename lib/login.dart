import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled3/API/CallApi.dart';
import 'package:untitled3/API/TokenStorage.dart';
import 'package:untitled3/Widget .dart';
import 'package:untitled3/signup.dart';

import 'Dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'Image/logo.png',
                height: 200,
                width: 200,
              ),
              SizedBox(
                height: 50,
              ),
              InputField(
                  hintText: 'Enter Email',
                  labelText: 'Email',
                  controller: emailController),
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
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Login();
                  },
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Don't have an account?"),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                child: Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> Login() async {

    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      print('Please Fill All Field');
    }
    else {
      var data = {
        'email': emailController.text,
        'password': passwordController.text,
      };
      final response = await CallApi().postData(data, 'login');
      var body = response.body;
      var apidata = json.decode(body)['data'];
      var status = response.statusCode;

      print(body);
      if (status == 200 || status == 201) {
        String token = apidata['access_token'];
        print(token);
        TokenStorage().storeAuthToken(token);
        emailController.clear();
        passwordController.clear();
      }
      if (status == 200 || status == 201) {
        print('Login Success');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      } else {
        print('Login Failed');
      }
    }
  }
}
