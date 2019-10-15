import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:validate/validate.dart';
import 'package:angel_validate/angel_validate.dart';
import 'package:web/test.dart';

class PageValidation extends StatefulWidget {
  @override
  _PageValidationState createState() => _PageValidationState();
}

class _PageValidationState extends State<PageValidation> {
  final formKey = GlobalKey<FormState>();
  String _userId, _id, _title, _body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Validation"),
      ),
      body: Form(
        autovalidate: true,
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    labelText: "User ID",
                  ),
                  onSaved: (String value) => _userId = value,
                  validator: nameValidator,
                ),
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    labelText: "ID",
                  ),
                  validator: nameValidator,
                  onSaved: (String value) => _id = value,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    child: Text("Validate"),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
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
          createPost().then((response) {});
          print("Navigation button pressed");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyTest()));
        },
      ),
    );
  }

  String _validateEmail(String value) {
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'Invalid Email';
    }
    return null;
  }

  String nameValidator(String value) {
    if (value.isEmpty) {
      return "Cannot Be empty";
    }

    // if (value.length < 4) {
    //   return "Name must be more than 4 character.";
    // }
    return null;
  }

  String numberValidator(String value) {
    if (value == null) {
      return null;
    }
    final n = num.tryParse(value);
    if (n == null) {
      return '$value is not a valid number';
    }
    if (value.length > 2) {
      return "Age cannot be more than 2 digits";
    }
    return null;
  }
}
