import 'package:flutter/material.dart';
import 'package:untitled3/API/CallApi.dart';
import 'package:untitled3/login.dart';
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
  TextEditingController userNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.95,
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
                child: Form(
                  key: _formKey,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InputField(
                        hintText: 'UserName ',
                        labelText: 'UserName',
                        controller: userNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Username';
                          }
                        },

                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InputField(
                        hintText: 'Enter Email',
                        labelText: 'Email',
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InputField(
                        hintText: 'Enter Password',
                        labelText: 'Password',
                        controller: passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InputField(
                        hintText: 'Confirm Password',
                        labelText: 'Confirm Password',
                        controller: confirmController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Confirm password';
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InputField(
                        hintText: 'phone number',
                        labelText: 'phone number',
                        controller: phoneController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone number';
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            signup();
                          },
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
          ),
      ),
    );
  }

  //Signup Function
  void signup() async {
    if (_formKey.currentState!.validate()) {
      print('Validated');
    if (passwordController.text == confirmController.text) {
      print('Password matched');
      var data = {
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'phone': phoneController.text,
        'username': userNameController.text,
        'password_confirmation': confirmController.text,
      };
      final response = await CallApi().postData(data, 'register');
      var body = response.body;
      var code = response.statusCode;
      print(code);
      if (code == 200||code==201) {
        nameController.clear();
        emailController.clear();
        passwordController.clear();
        confirmController.clear();
        phoneController.clear();
        userNameController.clear();
        print('User Registered');
        print(body);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
      else {
        print('User not Registered');
      }
    }
    else {
      print('Password not matched');
    }
  }

}}
