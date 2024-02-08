import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mapsense/data/getIdentity.dart';
import 'package:mapsense/data/logoutUser.dart';

class AccountPage extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Logged in as:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              fetchUserIdentity() as String,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(

              onPressed: () => logoutUser(context),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
