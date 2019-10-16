import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Post {
  final String userId;
  final String id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["userId"] = userId;
    map["title"] = title;
    map["body"] = body;

    return map;
  }
}

Future<Post> createPost(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return Post.fromJson(json.decode(response.body));
  });
}

class MyTest extends StatelessWidget {
  final Future<Post> post;

  MyTest({Key key, this.post}) : super(key: key);
  static final CREATE_POST_URL =
      'https://docs.google.com/spreadsheets/d/1-R7mtYeQm05F22LGGMix5cX-PVwsTs3XnuYDWGrMq0k/edit#gid=0';
  TextEditingController titleControler = new TextEditingController();
  TextEditingController bodyControler = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WEB SERVICE",
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Create Post'),
        ),
        body: new Container(
          margin: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: new Column(
            children: <Widget>[
              new TextField(
                controller: titleControler,
                decoration: InputDecoration(
                    hintText: "title....", labelText: 'Post Title'),
              ),
              new TextField(
                controller: bodyControler,
                decoration: InputDecoration(
                    hintText: "body....", labelText: 'Post Body'),
              ),
              new RaisedButton(
                onPressed: () async {
                  Post newPost = new Post(
                      userId: "123",
                      id: "0",
                      title: titleControler.text,
                      body: bodyControler.text);
                  Post p =
                      await createPost(CREATE_POST_URL, body: newPost.toMap());
                  print(p.title);
                },
                child: const Text("Create"),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            print("Navigation button pressed");
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

// void main() => runApp(MyTest());
