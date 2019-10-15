import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:web/model/post_model.dart';
import 'dart:io';

String url = 'https://jsonplaceholder.typicode.com/posts';

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

Future<Post> createPost(Post post) async {
  final response = await http.post('$url',
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: postToJson(post));

  return postFromJson(response.body);
}
