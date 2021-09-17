import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                flex: 1,
                child: Image.asset(
                  "assets/images/welcome.png",
                  fit: BoxFit.cover,
                )),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Text(
                          "Welcome To Foodie",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Deliciousness jumping into the mouth",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () =>
                              Navigator.of(context).pushNamed("/login"),
                          child: Text("Login"),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(240, 35),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () =>
                              Navigator.of(context).pushNamed("/signup"),
                          child: Text("SignUp"),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(240, 35),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
