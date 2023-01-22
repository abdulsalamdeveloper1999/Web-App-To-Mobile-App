// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final name;
  final email;
  final uid;
  final number;

  User({
    required this.uid,
    required this.name,
    required this.email,
    required this.number,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'uid': uid,
        'email': email,
        'number': number,
      };

  //get user data

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      uid: snapshot['uid'],
      name: snapshot['name'],
      email: snapshot['email'],
      number: snapshot['number'],
    );
  }
}

// 'username': username,
// 'uid': cred.user!.uid,
// 'email': email,
// 'bio': bio,
// 'followers': [],
// 'following': [],
// 'photoUrl': photoUrl,
