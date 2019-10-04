import 'package:flutter/material.dart';

class PageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
      ),
      body: ListView(
        padding: EdgeInsets.all(5),
        children: <Widget>[
          Card(
            color: Colors.red,
            elevation: 10.0,
            child: Container(
              height: 100.0,
              child: Center(child: Text('Card 1')),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: Container(
                height: 50,
                child: Center(
                  child: Text(
                    "Card 2",
                  ),
                )),
            color: Colors.purple,
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
                height: 75,
                child: Center(
                  child: Text("Card 3"),
                )),
            color: Colors.orange,
          )
        ],
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
          print("Navigation button pressed");
        },
      ),
    );
  }
}
