import 'package:flutter/material.dart';

class bottombarpage extends StatefulWidget {
 bottombarpage({Key? key}) : super(key: key);

  @override
  _bottombarpageState createState() =>  _bottombarpageState();
}

class  _bottombarpageState extends State<bottombarpage> {
  int _currentindex = 0;
  void _onTabBar(int nomor){
    setState(() {
      _currentindex = nomor;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Bar'),
      ),
      body: Text('Bottom Tab Bar'),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellow,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(fontSize: 20),
        unselectedLabelStyle: TextStyle(fontSize: 10),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: _currentindex,
        onTap: _onTabBar, 
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today),label: "Calender"),
          BottomNavigationBarItem(icon: Icon(Icons.chat),label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_ind),label: "Profile"),
        ],
      ),
    );
  }
}