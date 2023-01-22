import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_app/reusable_widgets/elevated_button_widget.dart';
import 'package:web_app/screens/sign_up_screen.dart';

import '../Utils/utils.dart';
import '../reusable_widgets/text_widget.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool visible = false;
  bool _isLoading = false;

  FirebaseAuth _auth = FirebaseAuth.instance;
  String errorMessage = '';

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() {
    setState(() {
      _isLoading = true;
    });
    if (formkey.currentState!.validate()) {
      _auth
          .signInWithEmailAndPassword(
              email: emailController.text.toString(),
              password: passwordController.text.toString())
          .then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
        setState(() {
          _isLoading = false;
        });
      }).onError((error, stackTrace) {
        switch (error.toString()) {
          case "[firebase_auth/invalid-email] The email address is badly formatted.":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "[firebase_auth/wrong-password] The password is invalid or the user does not have a password.":
            errorMessage = "Your password is wrong.";
            break;
          case "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "ERROR_USER_DISABLED":
            errorMessage = "User with this email has been disabled.";
            break;
          case "ERROR_OPERATION_NOT_ALLOWED":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          case "[firebase_auth/too-many-requests] We have blocked all requests from this device due to unusual activity. Try again later.":
            errorMessage = "Too many requests. Try again later";
            break;
          default:
            errorMessage = "${error.toString()}";
        }

        setState(() {
          _isLoading = false;
        });
        // debugPrint(error.toString());
        if (errorMessage != null) {
          // return Future.error(errorMessage);
          Utils().toastMessage(errorMessage);
          print(errorMessage.toString());
          setState(() {
            _isLoading = false;
          });
        }
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth auth = FirebaseAuth.instance;
    Firebase.initializeApp();
    final user = auth.currentUser;
    if (user != null) {
      Timer(Duration(milliseconds: 100), () {
        print('User is already login');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    } else {
      print('User is not login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 50,
                  ),
                  const SizedBox(height: 10),
                  MyText(
                    'WELCOME, BE A PART OF US',
                    size: 16,
                    weight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 50),
                  MyText(
                    'Continue with Mobile Number or Email',
                    size: 16,
                    weight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    validator: validateEmail,
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Mobile Number or Email',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    obscureText: visible,
                    validator: validatePassword,
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            visible = !visible;
                          });
                        },
                        child: Icon(
                          Icons.visibility,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  MyButton(
                      bgcolor: Colors.deepOrangeAccent,
                      bdcolor: Colors.deepOrangeAccent,
                      textColor: Colors.white,
                      loading: _isLoading,
                      text: 'Continue',
                      onPress: () {
                        login();
                      }),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.grey,
                      child: Center(
                        child: MyText('Sign Up', color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: MyText('OR'),
                      ),
                      const Expanded(
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  MyText(
                    'Continue with',
                    size: 16,
                    weight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black),
                        ),
                        child: Image.asset(
                          'assets/images/google.png',
                          height: 40,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black),
                        ),
                        child: Image.asset(
                          'assets/images/fblogoo.png',
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: [
                        TextSpan(
                          text: 'By continuing, you are agree to our ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        TextSpan(
                          text: 'terms and conditions ',
                          style: TextStyle(
                            color: Color(0xff0000FF),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        TextSpan(
                          text: 'See our',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        TextSpan(
                          text: ' privacy notice',
                          style: TextStyle(
                            color: Color(0xff0000FF),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
