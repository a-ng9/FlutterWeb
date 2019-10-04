import 'package:flutter/material.dart';
import 'package:web/page_3.dart';

class PageListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
      ),
      body: ListView.builder(
        itemCount: 21,
        itemBuilder: (context, position) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                position.toString(),
                style: TextStyle(fontSize: 22.0),
              ),
            ),
          );
        },
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
              context, MaterialPageRoute(builder: (context) => PageCard()));
        },
      ),
    );
  }
}
