import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app_firebase/screens/home_page.dart';
import 'package:food_app_firebase/screens/login_page.dart';
import 'package:food_app_firebase/screens/signup_page.dart';
import 'package:food_app_firebase/screens/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/welcome': (_) => WelcomePage(),
        '/login': (_) => LoginPage(),
        '/signup': (_) => SignupPage(),
        '/home': (_) => HomePage(),
      },
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, snap) {
            if (snap.hasData) {
              print(FirebaseAuth.instance.currentUser);
              return HomePage();
            }
            return WelcomePage();
          }),
    );
  }
}
