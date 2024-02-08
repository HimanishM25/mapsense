import 'package:firebase_auth/firebase_auth.dart';  
import 'package:flutter/material.dart';
import 'package:mapsense/presentation/screens/registerScreen.dart';

void logoutUser(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => RegisterScreen()));
}
