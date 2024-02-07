import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mapsense/presentation/screens/registerScreen.dart';
import 'package:mapsense/presentation/widgets/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return MaterialApp(
      theme: ThemeData(
        primaryColor: colorScheme.primary, 
        hintColor: colorScheme.secondary, 
        brightness: Brightness.light, 
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: colorScheme.primary, 
        hintColor: colorScheme.secondary, 
      ),
      themeMode: ThemeMode.system,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NavigationPage();
          } else {
            return RegisterScreen();
          }
        },
      ),
    );
  }
}




