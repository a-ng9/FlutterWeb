import 'package:flutter/material.dart';
import 'package:web/utils/api_manager.dart';
import 'package:web/model/post_model.dart';
import 'package:web/page_3.dart';

class PageListView extends StatefulWidget {
  @override
  _PageListViewState createState() => _PageListViewState();
}

class _PageListViewState extends State<PageListView> {
  List<Post> _allUsers = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  _getUsers() async {
    _allUsers = await APIManager.getUsers();

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listiew"),
      ),
      body: _loading
          ? Center(
              child: Text("Loading..."),
            )
          : ListView.builder(
              itemCount: _allUsers.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildCell(_allUsers[index]);
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
          print("Navigation button pressed");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PageCard()));
        },
      ),
    );
  }

  _buildCell(Post user) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 1.5,
      ),
      child: ListTile(
        leading: Text(
          "${user.id}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${user.userId}',
              style: TextStyle(fontSize: 10),
            ),
            Text(
              user.title,
            ),
          ],
        ),
      ),
    );
  }
}
