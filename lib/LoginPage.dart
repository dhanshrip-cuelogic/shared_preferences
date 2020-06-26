import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'WelcomeScreen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String err = '';

  _saveDetails() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    if ((emailController.text).isNotEmpty ||
        (passwordController.text).isNotEmpty) {
      await sharedPref.setString('email', emailController.text);
      await sharedPref.setString('password', passwordController.text);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    } else {
      setState(() {
        err = 'Please enter some text !!!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'Enter Email'),
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(hintText: 'Enter Password'),
              ),
              RaisedButton(
                color: Colors.lightBlueAccent,
                onPressed: _saveDetails,
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
              ),
              Text(
                err,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}
