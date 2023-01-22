import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Utils/utils.dart';
import '../models/user_model.dart' as model;
import '../screens/home_screen.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // sign up user
  Future<String> SignUpUser({
    required String email,
    required String password,
    required String number,
    required String name,
  }) async {
    String result = 'Some error occurred';

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          name.isNotEmpty ||
          number.isNotEmpty) {
        //register the user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        print(cred.user!.uid);

        model.User user = model.User(
          uid: cred.user!.uid,
          name: name,
          email: email,
          number: number,
        );

        // add user to our database
        await _firestore.collection('user').doc(cred.user!.uid).set(
              user.toJson(),
            );

        result = 'Success';
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  //login user
  Future<String> LoginUser({
    required String email,
    required String password,
  }) async {
    User? user;

    String errorMessage = '';

    try {
      if (formkey.currentState!.validate()) {
        UserCredential result = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        user = result.user;
      }
    } catch (error) {
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
    }

    if (errorMessage != null) {
      // return Future.error(errorMessage);
      Utils().toastMessage(errorMessage);
      print(errorMessage.toString());
    }

    return user!.uid;
  }
}
