import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_register_socialmedia_fikran/homepage.dart';
import 'package:login_register_socialmedia_fikran/signup.dart';

void main() {
  runApp(MyApp());
}

TextEditingController getUser = new TextEditingController();
TextEditingController getPass = new TextEditingController();
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 32,
                      letterSpacing: 4.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.blue[300],
                      fontSize: 18,
                      letterSpacing: 1.0),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: getUser,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    suffixIcon: Icon(
                      Icons.person,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: getPass,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    suffixIcon: Icon(Icons.key),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                letterSpacing: 2.0,
                                color: Colors.blue[900],
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          height: 40,
                          textColor: Colors.white,
                          color: Colors.blue[900],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          onPressed: () {
                            String user = 'belajar';
                            String pass = '1234';
                            if (getUser.text.length == 0) {
                              final errorUser = SnackBar(
                                content: Text('Username tidak boleh kosong!'),
                                duration: Duration(seconds: 2),
                              );
                              _scaffoldKey.currentState
                                  ?.showSnackBar(errorUser);
                            } else if (getPass.text.length == 0) {
                              final errorUser = SnackBar(
                                content: Text('Password tidak boleh kosong!'),
                                duration: Duration(seconds: 2),
                              );
                              _scaffoldKey.currentState
                                  ?.showSnackBar(errorUser);
                            } else if (getUser.text == user &&
                                getPass.text == pass) {
                              final errorUser = SnackBar(
                                content: Text(
                                    'Selamat datang user: ' + getUser.text),
                                duration: Duration(seconds: 2),
                              );
                              _scaffoldKey.currentState
                                  ?.showSnackBar(errorUser);
                              //delay to Home page
                              Timer(Duration(seconds: 2), () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              });
                            } else {
                              final errorUser = SnackBar(
                                content: Text('Cek kembali input anda!'),
                                duration: Duration(seconds: 2),
                              );
                              _scaffoldKey.currentState
                                  ?.showSnackBar(errorUser);
                            }
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                letterSpacing: 2,
                                color: Colors.white,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
