import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
String pattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
RegExp regExps = new RegExp(pattern);

class _SignupPageState extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController re_passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool passHide = true;
  bool isChange = false;
  @override
  Widget build(BuildContext context) {
    Future send() async {
      try {
        // Authentication For Create User
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: usernameController.text,
          password: passController.text,
        );
        print("Successfully User Created");

        // Send Data To Firestore
        await FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user!.uid)
            .set({
          "name": nameController.text.trim(),
          "email": usernameController.text.trim(),
          "password": passController.text.trim(),
          "uid": userCredential.user!.uid,
        });
        // Clear TextField
        nameController.clear();
        usernameController.clear();
        passController.clear();
        re_passController.clear();
        // Navigate to Login Screen
        Navigator.of(context).pushNamed("/login");

        setState(() {
          isChange = false;
        });
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

    void validation() {
      final _form = _formKey.currentState;
      if (_form!.validate()) {
        print("yes");
        send();
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
            child: SingleChildScrollView(
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
                    validator: (value) {
                      if (value == "" || value == null) {
                        return "Please fill Username";
                      } else if (value.length < 3) {
                        return "Username is too short";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Username",
                      border: OutlineInputBorder(),
                    ),
                    controller: nameController,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == "" || value == null) {
                        return "Please fill Email";
                      } else if (!regExp.hasMatch(value)) {
                        return "Email is Invalid";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                    controller: usernameController,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
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
                      suffixIcon: GestureDetector(
                        onTap: () {
                          // FocusScope.of(context).unfocus();
                          setState(() {
                            passHide = !passHide;
                          });
                        },
                        child: passHide
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                    ),
                    controller: passController,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == "" || value == null) {
                        return "Please fill Password";
                      } else if (value.length < 8) {
                        return "Password is less than 8";
                      } else if (value != passController.text) {
                        return "Password doesn't match";
                      }
                    },
                    obscureText: passHide,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          // FocusScope.of(context).unfocus();
                          setState(() {
                            passHide = !passHide;
                          });
                        },
                        child: passHide
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                    ),
                    controller: re_passController,
                  ),
                  SizedBox(height: 30),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     validation();
                  //   },
                  //   child: Text("SignUp"),
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
                                "SignUp",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius:
                              BorderRadius.circular(isChange ? 45 : 8)),
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
          ),
        ),
      ),
    );
  }
}
