import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PasswordReset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: GetTextFieldValue()
          );
  }
}
class GetTextFieldValue extends StatefulWidget {
 
  _TextFieldValueState createState() => _TextFieldValueState();
 
}
 
class _TextFieldValueState extends State<GetTextFieldValue> {
 
  final textFieldValueHolder = TextEditingController();
 
  String result = '';
 
  getTextInputData(){
    setState(() {
      result = textFieldValueHolder.text;
      // POST Request premaking
      Future<http.Response> postRequest () async {
        var url ='https://stepwebapideploy.azurewebsites.net/api/registration';
        //var body = jsonEncode();
      }
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Password Reset'),
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter email',
                    ),
                  ),
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Request Password Change'),
                  onPressed: getTextInputData,
                )
              ],
            )));
  }
}