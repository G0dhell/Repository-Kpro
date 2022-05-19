import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class Post extends StatefulWidget {
  final String imageUrl, title, desc;
  Post({required this.imageUrl, required this.title, required this.desc});
  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  Widget postContent(htmlContent) {
    return Html(
      data: htmlContent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: const Radius.circular(30),bottomRight: const Radius.circular(30)),
                gradient: LinearGradient(
                    colors: [Colors.red,Colors.pink],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter
                )
            ),
          ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.imageUrl),
            const SizedBox(height: 10),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 18),
            ),
            postContent(widget.desc)
          ],
        ),
      ),
    );
  }
}
