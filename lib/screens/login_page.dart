import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passController = TextEditingController();

    login() async {
      print("ready");
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernameController.text,
          password: passController.text,
        );
        usernameController.clear();
        passController.clear();
        print("Successfully Login");

        Navigator.of(context).pushNamed("/home");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("No user found for that email.")));
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Wrong password provided for that user.')));
          print('Wrong password provided for that user.');
        }
      }
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "LOGIN",
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(height: 40),
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(hintText: "Username"),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: passController,
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                login();
              },
              child: Text("Login"),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(240, 35),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed("/signup"),
                  child: Text("Register"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
