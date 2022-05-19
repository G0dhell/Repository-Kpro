// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kpro/apiservice.dart';
import 'package:kpro/login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final loginText = TextEditingController();
  final passwordText = TextEditingController();
  final emailText = TextEditingController();
  callRegisterApi() {
    final service = ApiServicesRegister();

    service.apiCallRegister(
      {
        "login": loginText.text,
        "email": emailText.text,
        "password": passwordText.text,
      },
    ).then((value) {
      if (value.error != null) {
        print("get data >>>>>> " + value.error!);
      } else {
        print(value.token!);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
        //push
      }
    });
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
              children: [
                Text("Welcome",
                    style: TextStyle(fontSize: 30, color: Colors.black)),
                Text("Sign Up",
                    style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 31, 73, 241))),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Image.asset(
                    'assets/logok.png',
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: loginText,
                  decoration: InputDecoration(
                      labelText: "ID",
                      labelStyle:
                          TextStyle(fontSize: 15, color: Colors.grey.shade400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: emailText,
                  decoration: InputDecoration(
                      labelText: "Email ID",
                      labelStyle:
                          TextStyle(fontSize: 15, color: Colors.grey.shade400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: passwordText,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle:
                          TextStyle(fontSize: 15, color: Colors.grey.shade400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){
                    callRegisterApi();
                  },
                  child: Container(
                    height: size.height / 14,
                    width: size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 30, 44, 238),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
