import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oxy_boot/View/usersignin/SignUp.dart';

import '../../Controller/AuthController.dart';
import '../../constraints/CustomText.dart';

// import 'package:panda_period/auth/GetAuth.dart';

class LoginInPage extends StatefulWidget {
  const LoginInPage({super.key});

  @override
  State<LoginInPage> createState() => _LoginInPageState();
}

class _LoginInPageState extends State<LoginInPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //GetAuth controller = Get.put(GetAuth());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        
        body: SafeArea(
            child: Center(
          child: Container(
            width: 350,
            height: 400,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/own/G.png"),
                  fit: BoxFit.fill),
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
            child: Center(
              child: Column(children: [
                

                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 9, 17, 88),
                  ),
                ),
                const SizedBox(height: 40),
                // ignore: prefer_const_constructors
                CustomText(
                  hintText: 'Enter your email',
                  textInputType: TextInputType.emailAddress,
                  isPass: false,
                  textController: emailController,
                ),
                const SizedBox(height: 20),
                // ignore: prefer_const_constructors
                CustomText(
                  hintText: 'Enter your password',
                  textInputType: TextInputType.emailAddress,
                  isPass: true,
                  textController: passwordController,
                ),
                const SizedBox(height: 20),

                const SizedBox(
                  width: 90,
                ),
                ElevatedButton(
                  onPressed: () {
                    GetAuth.instance.logInUser(emailController.text.trim(),
                        passwordController.text.trim());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white10,
                    shadowColor: Color.fromARGB(26, 81, 160, 180),
                  ),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 13, 1, 39),
                    ),
                  ),
                ),

                const SizedBox(width: 60),
                const SizedBox(height: 20),
                Wrap(
                  children: [
                    RichText(
                        text: TextSpan(
                      text: "Don't have an account?",
                      style: const TextStyle(
                        color: Color.fromARGB(221, 51, 48, 48),
                      ),
                      children: [
                        TextSpan(
                            text: ' SignUp',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 22, 72, 165),
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(const SignUpPage());
                              })
                      ],
                    )),
                  ],
                ),
                Wrap(
                  children: [
                    RichText(
                        text: TextSpan(
                      text: "Forgotten password?",
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                            text: 'RECOVER',
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                GetAuth.instance
                                    .resetPassword(emailController.text.trim());
                              })
                      ],
                    )),
                  ],
                ),
              ]),
            ),
          ),
        )));
  }
}
