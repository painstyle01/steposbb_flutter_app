import 'package:flutter/material.dart';
import 'package:osbb/password_reset.dart';
import 'package:osbb/user_registration.dart';  
import 'password_reset.dart';


void main() {  
  runApp(MaterialApp( home: MyApp(),));  
}  
  
class MyApp extends StatelessWidget {  
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      home: new LoginScreen(),
    );
  }
}   

class LoginScreen extends StatelessWidget{
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
        appBar: AppBar(  
          title: Text('ОСББ'),  
        ),  
        body: Padding(  
            padding: EdgeInsets.all(15),  
            child: Column(  
              children: <Widget>[  
                Padding(  
                  padding: EdgeInsets.all(15),  
                  child: TextField(  
                    decoration: InputDecoration(  
                      border: OutlineInputBorder(),  
                      labelText: 'User Name',  
                      hintText: 'Enter Your Name',  
                    ),  
                  ),  
                ),  
                Padding(  
                  padding: EdgeInsets.all(15),  
                  child: TextField(  
                    obscureText: true,  
                    decoration: InputDecoration(  
                      border: OutlineInputBorder(),  
                      labelText: 'Password',  
                      hintText: 'Enter Password',  
                    ),  
                  ),  
                ),
                RaisedButton(  
                  textColor: Colors.white,  
                  color: Colors.blue,  
                  child: Text('Sign In'),  
                  onPressed: (){},  
                ),
                InkWell(
                  child: new Text('Reset Password', style: TextStyle(color: Colors.blue)),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PasswordReset()));
                  },
                ),
                InkWell(
                  child: new Text('Register', style: TextStyle(color: Colors.blue)),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserRegistration()));
                  },
                )
              ],  
            )  
        )  
    );  
  } 
}
