import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxy_boot/View/usersignin/Login.dart';

import '../../Controller/AuthController.dart';
import '../../constraints/CustomText.dart';
// import 'package:panda_period/auth/custom.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GetAuth contoller = Get.put(GetAuth());
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
        body: 
        SafeArea(
            child: Center(
      child: Container(
        width: 350,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              offset: Offset(1, 1),
              color: Color.fromARGB(255, 31, 126, 189),
            )
          ],
          border: Border.all(
            color: Color.fromARGB(255, 36, 107, 148),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(11),
        ),
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome sign up',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 4, 8, 59),
                ),
              ),
              const SizedBox(height: 20),
              // ignore: prefer_const_constructors
              CustomText(
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                isPass: false,
                textController: emailController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Contact Phone Number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // ignore: prefer_const_constructors
              CustomText(
                hintText: 'Enter your password',
                textInputType: TextInputType.emailAddress,
                isPass: true,
                textController: passwordController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Contact Phone Number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    contoller.createUser(emailController.text.trim(),
                        passwordController.text.trim());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white10,
                    shadowColor: Colors.grey,
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 6, 12, 88),
                    ),
                  )),

              const SizedBox(height: 20),
              RichText(
                  text: TextSpan(
                text: 'Have an account?',
                style: const TextStyle(
                  color: Color.fromARGB(255, 7, 6, 6),
                ),
                children: [
                  TextSpan(
                      text: '  LogIn',
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(LoginInPage(navigationindex: 0,));
                        })
                ],
              )),
            ],
          ),
        ),
      ),
    )));
  }
}
