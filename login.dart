// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kpro/apiservice.dart';
import 'package:kpro/restorepass.dart';
import 'package:kpro/sign_up.dart';
import 'package:kpro/views/home.dart';
import 'package:http/http.dart' as http;
import 'package:kpro/views/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginText = TextEditingController();
  final passwordText = TextEditingController();
  void _loginSubmit() async {
    final resp = await http.post(
        Uri.parse('https://staging.klasspro.id/wp-json/ms_lms/v1/login'),
        body: {
          "login": loginText.text.toString(),
          "password": passwordText.text.toString(),
        });
    if (resp.statusCode == 200) {
      final getResponBody = jsonDecode(resp.body);
      print(getResponBody);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context)=>Home()));
    } else {
      final getResponBody = jsonDecode(resp.body);
      print(getResponBody);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 1,
                ),
                Center(
                  child: Image.asset(
                    'assets/kipro.png',
                    width: 310,
                    height: 310,
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                Text(
                  "Sign in Continue",
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade400),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: loginText,
                  decoration: InputDecoration(
                      labelText: "Email ID",
                      labelStyle: TextStyle(
                          fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  obscureText: true,
                  controller: passwordText,
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                          fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: ((context) => RestorePass())),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Restore Password",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    _loginSubmit();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: size.height / 18,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 42, 61, 232),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "Login ",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: size.height / 30,
                    width: size.width/ 3,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "      Facebook ", 
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Belum Memiliki Akun? ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Signup())),
                      child: Text(
                        "Daftar",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 41, 74, 238)),
                      ),
                    )
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
