import 'package:flutter/material.dart';
import 'package:web/utils/api_manager.dart';

class PageValidation extends StatefulWidget {
  @override
  _PageValidationState createState() => _PageValidationState();
}

class _PageValidationState extends State<PageValidation> {
  final formKey = GlobalKey<FormState>();
  String _id, _userId, _title, _body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Validation form"),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextFormField(
                  decoration: InputDecoration(labelText: "ID"),
                  validator: nameValidator,
                  onSaved: (String value) => _id = value),
              TextFormField(
                decoration: InputDecoration(labelText: "User ID"),
                onSaved: (String value) => _userId = value,
                validator: nameValidator,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Post Title'),
                onSaved: (String value) => _title = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Post Body'),
                onSaved: (String value) => _body = value,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    child: Text("Create"),
                    onPressed: () async {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        APIManager.postUser(_id, _userId, _title, _body);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
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
          // print("Navigation button pressed");
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => MyTest()));
        },
      ),
    );
  }

//
// Code below are functions for the validator
//
  String nameValidator(String value) {
    if (value.isEmpty) {
      return "Cannot Be empty";
    }
    final n = num.tryParse(value);
    if (n == null) {
      return '$value is not a valid number';
    }
    // if (value.length < 4) {
    //   return "Name must be more than 4 character.";
    // }
    return null;
  }

  String numberValidator(String value) {
    final n = num.tryParse(value);
    if (n == null) {
      return '$value is not a valid number';
    }
    // if (value.length > 3) {
    //   return " number cannot be more than 2 digits";
    // }
    return null;
  }
}
