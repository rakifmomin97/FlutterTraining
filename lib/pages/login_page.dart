import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.png",
              fit: BoxFit.fitWidth,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome $name",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        changeButton = true;
                      });

                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: 50,
                      width: changeButton ? 50 : 150,
                      alignment: Alignment.center,
                      child: changeButton
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                      ),
                    ),
                  )
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  //   child: Text("Login"),
                  //   style: TextButton.styleFrom(minimumSize: Size(150, 50)),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
