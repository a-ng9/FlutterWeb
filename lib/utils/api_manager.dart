import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:web/model/post_model.dart';

String url = 'https://jsonplaceholder.typicode.com/posts';

class APIManager {
//GET request with future
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

//POST request with future
  static Future<void> postUser(
      String id, String userid, String title, String body) async {
//recreated the post model in here because I was having problems converting integer to string
//and it is also case sensitive
    final data = {
      'data': [
        {
          'id': id,
          'userid': userid,
          'title': title,
          'body': body,
        }
      ]
    };
    final encoded = json.encode(data);
    // print('encoded: $encoded');

    try {
      // final response =
      await http.post(
        'https://sheetdb.io/api/v1/lbd0m4scw6ml0',
        headers: {"Content-Type": "application/json"},
        body: encoded,
      );

      // print('response: ${response.body}');
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
