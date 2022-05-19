import 'package:async/async.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> fetchWpPosts() async {
  final response = await http.get(
    Uri.parse("https://staging.klasspro.id/wp-json/"),
    headers: {
      "Accept": "application/json",
    },
  );

  var convertDatetoJson = jsonDecode(response.body);
  Future<List<dynamic>> convertedDatatoJson;
}

Future fetchWpPostImageUrl(href) async {
  final response = await http.get(Uri.parse(
    href),
    headers: {
      "Accept": "application/json",
    },
  );

  var convertedDatatoJson = jsonDecode(response.body);
  return convertedDatatoJson;
}