import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_login1/Widgets/modals/login_modal.dart';

class LoginForm extends StatefulWidget {
  final LoginModel login;
  LoginForm(this.login);

  @override
  _LoginFormState createState() => _LoginFormState(this.login);
}

class _LoginFormState extends State<LoginForm> {
  final LoginModel login;
  _LoginFormState(this.login);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
          child: Container(
        color: getColor(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 40.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  login.name,
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail,color: Colors.teal,),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)
                    ),
                    hintText: login.children[0].placeholder),
                    validator: (value) {
                      RegExp pw = RegExp(login.children[0].validatorRegex);
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if(!pw.hasMatch(value)) {
                        return "Not a valid one";
                      }
                      return null;
                    },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                //  validator: login.children[1].validatorRegex,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock,color: Colors.teal,),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)
                    ),
                    hintText: login.children[1].placeholder),
                    validator: (value) {
                      RegExp pw = RegExp(login.children[1].validatorRegex);
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if(!pw.hasMatch(value)) {
                        return "Not a valid one";
                      }
                      return null;
                    },
              ),
            ),
            RaisedButton(
              onPressed: () {
                _formKey.currentState.validate();
              },
              color: Colors.teal,
              child: Text(
                login.children[2].text,
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getColor() {
    return Color(int.parse(login.background.substring(1,7), radix: 16) + 0xFF000000);
  }
}
