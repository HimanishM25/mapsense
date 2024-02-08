import 'package:firebase_auth/firebase_auth.dart';

Future<String> fetchUserIdentity() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    return 'Unknown';
  } else {
    throw Exception('User not authenticated');
  }
}
