import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_app/reusable_widgets/elevated_button_widget.dart';
import 'package:web_app/screens/home_screen.dart';
import '../Utils/utils.dart';
import '../resources/auth_methods.dart';
import '../reusable_widgets/text_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final databaseRef = FirebaseDatabase.instance.ref('Post');
  String id = DateTime.now().microsecondsSinceEpoch.toString();
  bool visible = true;
  bool _isLoading = false;

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().SignUpUser(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
      number: numberController.text,
    );
    if (res != 'Success') {
      Utils().toastMessage(res.toString());
      print(res.toString());
      setState(() {
        _isLoading = false;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
      setState(
        () {
          Utils().toastMessage(res.toString());
          print(res.toString());
          _isLoading = false;
          // _controller.emailController.clear();
          // _controller.passwordController.clear();
          // _controller.nameController.clear();
        },
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    numberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 40, left: 16, right: 16),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        'Sign Up',
                        weight: FontWeight.w400,
                        size: 14,
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  MyText(
                    'Hi new user buddy, let\'s you started with us',
                    weight: FontWeight.bold,
                    size: 14,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Number Required';
                      }
                      return null;
                    },
                    controller: numberController,
                    decoration: InputDecoration(
                      hintText: 'India(+91)',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'name is required';
                      } else if (value.contains('1-10')) {
                        return 'name is required';
                      }
                      return null;
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty ||
                          !value.contains('@') ||
                          !value.contains('.') ||
                          value.contains('comcom')) {
                        return 'Invalid Email';
                      }
                      return null;
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: validatePassword,
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 15),

                  MyButton(
                    loading: _isLoading,
                    text: 'Continue',
                    onPress: () async {
                      if (_formkey.currentState!.validate()) {
                        // Get.offAndToNamed(Routes.FACILITY_LOOKING_FOR);
                        signUpUser();
                        // print('tap');
                      }
                    },
                    bgcolor: Colors.orange,
                    bdcolor: Colors.orange,
                    textColor: Colors.white,
                  ),

                  // MyButton(
                  //   text: 'Login',
                  //   onPress: () {
                  //     signUpUser();
                  //   },
                  //   bgcolor: Colors.grey,
                  // ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.grey,
                      child: Center(
                        child: MyText(
                          'Login',
                          color: Colors.white,
                          size: 14,
                        ),
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
                        child: MyText(
                          'OR',
                          size: 14,
                          weight: FontWeight.w400,
                        ),
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
                          height: 20,
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
                          height: 20,
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
                            fontFamily: 'Poppins',
                          ),
                        ),
                        TextSpan(
                          text: 'terms and conditions ',
                          style: TextStyle(
                            color: Color(0xff0000FF),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        TextSpan(
                          text: 'See our',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        TextSpan(
                          text: ' privacy notice',
                          style: TextStyle(
                            color: Color(0xff0000FF),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
