import 'package:flutter/material.dart';

class CalenderPage extends StatefulWidget {
  @override
  _CalenderPageState createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('yuhu'),
      ),
      body: Center(
        child: Text(
          'CalenderPage'
          ),
      ),
    );
  }
}
