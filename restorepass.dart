import 'package:flutter/material.dart';
import 'package:kpro/apiservice.dart';
import 'package:kpro/login.dart';

class RestorePass extends StatefulWidget {
  const RestorePass({ Key? key }) : super(key: key);

  @override
  State<RestorePass> createState() => _RestorePassState();
}

class _RestorePassState extends State<RestorePass> {
  final emailText = TextEditingController();
  callRestoreApi() {
    final service = ApiServicesRestore();

    service.apiCallRestore(
      {
        "email": emailText.text,
      },
    ).then((value) {
      if (value.error != null) {
        print("get data >>>>>> " + value.error!);
      } else {
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
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "KLASSPRO.ID",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 194, 174, 0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Image.asset(
                    'assets/logok.png',
                    width: 150,
                    height: 150,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Input your Email",
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade400),
                ),
                SizedBox(
                  height: 10,
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
                GestureDetector(
                  onTap: (){
                    callRestoreApi();
                  },
                  child: Container(
                    height: size.height / 14,
                    width: size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "Restore",
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