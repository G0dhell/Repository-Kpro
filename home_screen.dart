// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kpro/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height:MediaQuery.of(context).size.height * 0.6 ,
                      decoration: BoxDecoration(
                        // color: kSecondaryColor.withOpacity(0.1),\
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: 
                      TextField(
                        onChanged: (value) {
                          
                        },
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "Search Product",
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width,
                            vertical: MediaQuery.of(context).size.width,
                          )
                        )
                      ),
                    )
                  ]
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}