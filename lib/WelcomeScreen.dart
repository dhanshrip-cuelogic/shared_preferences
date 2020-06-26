import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LoginPage.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String welcomeText = '';
  String email = '';
  String password = '';

  _showDetails() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    setState(() {
      welcomeText =
          'Welcome, You have successfully logged in with following credentials:-';
      email = sharedPref.getString('email');
      password = sharedPref.getString('password');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Screen'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            color: Colors.lightBlueAccent,
            onPressed: _showDetails,
            child: Text(
              'Click Here To see details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
              ),
            ),
          ),
          Text(
            welcomeText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
            ),
          ),
          Text(
            email,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
          Text(
            password,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
        ],
      )),
    );
  }
}
