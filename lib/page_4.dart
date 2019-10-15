import 'package:flutter/material.dart';
import 'package:validate/validate.dart';
import 'package:angel_validate/angel_validate.dart';

class PageValidation extends StatefulWidget {
  @override
  _PageValidationState createState() => _PageValidationState();
}

class _PageValidationState extends State<PageValidation> {
  final formKey = GlobalKey<FormState>();
  String _name, _lastName, _age, _email;

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
                    labelText: "First Name",
                    icon: Icon(Icons.person, color: Colors.black),
                  ),
                  onSaved: (String value) => _name = value,
                  validator: nameValidator,
                ),
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    labelText: "Last Name",
                    icon: Icon(Icons.person_outline, color: Colors.black),
                  ),
                  validator: nameValidator,
                  onSaved: (String value) => _lastName = value,
                ),
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    labelText: "Age",
                    icon:
                        Icon(Icons.perm_contact_calendar, color: Colors.black),
                  ),
                  keyboardType: TextInputType.number,
                  validator: numberValidator,
                  onSaved: (String value) => _age = value,
                ),
              ),
              Container(
                height: 100,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    labelText: "Email",
                    icon: Icon(Icons.email, color: Colors.black),
                  ),
                  validator: _validateEmail,
                  // validator: (input) =>
                  //     !input.contains('@') ? 'Not valid email' : null,
                  onSaved: (String value) => _email = value,
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

    if (value.length < 4) {
      return "Name must be more than 4 character.";
    }
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
