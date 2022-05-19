// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:kpro/login.dart';
import 'package:kpro/views/post.dart';
import 'package:kpro/wp-api.dart';
import 'package:flutter_html/flutter_html.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentindex = 2;
  void _onTabBar(int nomor) {
    setState(() {
      _currentindex = nomor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen())),
              icon: Icon(Icons.logout)),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 37, 73, 249)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
      ),
      body: FutureBuilder(
        future: fetchWpPosts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Map wppost = snapshot.data[index];

                  return PostTile(
                      href: wppost["_links"]["about"][0]["href"],
                      title: wppost["title"]["rendered"],
                      desc: wppost["excerpt"]["rendered"],
                      content: wppost["content"]["rendered"]);
                });
          }
          return const CircularProgressIndicator();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        selectedItemColor: Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: Color.fromARGB(255, 0, 34, 255),
        selectedLabelStyle: TextStyle(fontSize: 20),
        unselectedLabelStyle: TextStyle(fontSize: 10),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: _currentindex,
        onTap: _onTabBar,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "Calender"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_ind), label: "Profile"),
        ],
      ),
    );
  }
}

class PostTile extends StatefulWidget {
  final String href, title, desc, content;
  PostTile({
    required this.content,
    required this.desc,
    required this.href,
    required this.title,
  });

  @override
  State<PostTile> createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  var imageUrl = "";

  Widget shortDescriptionView() {
    return Html(data: widget.desc, style: {
      "body": Style(textAlign: TextAlign.justify),
    });
  }

  Widget titleView() {
    return Html(data: widget.title, style: {
      "body": Style(
          fontSize: const FontSize(18.0),
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.justify),
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Post(
                      imageUrl: imageUrl,
                      desc: widget.content,
                      title: widget.title,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          FutureBuilder(
            future: fetchWpPostImageUrl(widget.href),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                // imageUrl = snapshot.data["guid"]["rendered"];
                // return Image.network(snapshot.data["guid"]["rendered"]);
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
          const SizedBox(height: 8),
          titleView(),
          const SizedBox(height: 5),
          shortDescriptionView(),
        ]),
      ),
    );
  }
}
