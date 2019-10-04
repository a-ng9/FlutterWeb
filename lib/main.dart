import 'package:flutter/material.dart';
import 'package:web/page_2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter web/app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'GridView'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        padding: const EdgeInsets.only(top: 15),
        crossAxisCount: 3,
        children: List.generate(5, (index) {
          return Container(
            color: Colors.yellow,
            margin: const EdgeInsets.all(5),
            child: Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline,
              ),
            ),
          );
        }),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.teal,
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          print("pressed");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PageListView()));
        },
      ),
    );
  }
}
