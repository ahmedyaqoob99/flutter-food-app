import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    bool loading = false;
    TextEditingController nameController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController re_passController = TextEditingController();

    Future send() async {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: usernameController.text,
          password: passController.text,
        );
        print("Successfully User Created");

        await FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user!.uid)
            .set({
          "name": nameController.text.trim(),
          "email": usernameController.text.trim(),
          "password": passController.text.trim(),
          "uid": userCredential.user!.uid,
        });
        nameController.clear();
        usernameController.clear();
        passController.clear();
        re_passController.clear();
        Navigator.of(context).pushNamed("/login");
        print("Successfully Data Added in Database");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("The password provided is too weak."),
            ),
          );
          print("'weak-password' ==> The password provided is too weak.");
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text("The account already exists for that email.")),
          );
          print(
              "'email-already-in-use' ==>The account already exists for that email.");
        }
      } catch (e) {
        print("error ==> $e");
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("$e")));
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
              "SIGN UP",
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(height: 40),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(hintText: "Name"),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(hintText: "Username"),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: passController,
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: re_passController,
              decoration: InputDecoration(hintText: "Re-type Password"),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                send();
              },
              child: Text("SignUp"),
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
                Text("Already have an account? "),
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed("/login"),
                  child: Text("Login"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
