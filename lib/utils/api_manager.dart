import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:web/model/post_model.dart';
import 'dart:io';

String url = 'https://jsonplaceholder.typicode.com/posts';
String _url =
    "https://docs.google.com/spreadsheets/d/1-R7mtYeQm05F22LGGMix5cX-PVwsTs3XnuYDWGrMq0k/edit#gid=0";

class APIManager {
  // static final String url = "https://jsonplaceholder.typicode.com/posts";

  static Future<List<Post>> getUsers() async {
    try {
      final response = await http.get("$url");
      if (response.statusCode == 200) {
        return userFromJson(response.body);
      } else {
        throw Exception('Failed to load');
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}

Future<Post> createPost(String _url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return Post.fromJson(json.decode(response.body));
  });
}
