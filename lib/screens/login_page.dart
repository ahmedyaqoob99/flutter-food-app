import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
String pattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
RegExp regExps = new RegExp(pattern);

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool passHide = true;

  bool isChange = false;

  @override
  Widget build(BuildContext context) {
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
        print("Successfully Login ==> $userCredential");

        Navigator.of(context).pushNamed("/home");
        setState(() {
          isChange = false;
        });
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

    void validation() {
      final _form = _formKey.currentState;
      if (_form!.validate()) {
        login();
      } else {
        print("no");
        setState(() {
          isChange = false;
        });
      }
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
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
                  validator: (value) {
                    if (value == "" || value == null) {
                      return "Please fill Email";
                    } else if (!regExp.hasMatch(value)) {
                      return "Email is Invalid";
                    }
                  },
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(CupertinoIcons.envelope),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: passController,
                  validator: (value) {
                    if (value == "" || value == null) {
                      return "Please fill Password";
                    } else if (value.length < 8) {
                      return "Password is less than 8";
                    }
                  },
                  obscureText: passHide,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(CupertinoIcons.lock),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        // FocusScope.of(context).unfocus();
                        setState(() {
                          passHide = false;
                        });
                      },
                      child: passHide
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                // ElevatedButton(
                //   onPressed: () {
                //     validation();
                //   },
                //   child: Text("Login"),
                //   style: ElevatedButton.styleFrom(
                //     fixedSize: Size(240, 40),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //   ),
                // ),
                InkWell(
                  onTap: () async {
                    setState(() {
                      isChange = true;
                    });

                    await Future.delayed(Duration(seconds: 1));
                    validation();
                    // await Navigator.pushNamed(context, MyRoutes.homeRoute);
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: isChange ? 45 : 160,
                    height: isChange ? 45 : 45,
                    alignment: Alignment.center,
                    child: isChange
                        ? Icon(Icons.done_all)
                        : FittedBox(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(isChange ? 45 : 8)),
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
        ),
      ),
    );
  }
}
