import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:longinapp/auth_provider.dart';
import 'package:longinapp/register.dart';
import 'package:longinapp/success.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoggedIn = false;
  Map _userObj = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('러브캠프')),
          SizedBox(height: 30),
          Container(
            width: 360,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  contentPadding: EdgeInsets.only(top: 14),
                  hintText: 'Enter your Email',
                  prefixIcon: Icon(Icons.email)),
            ),
          ),
          SizedBox(height: 30),
          Container(
            width: 360,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  contentPadding: EdgeInsets.only(top: 14),
                  hintText: 'Enter your Password',
                  prefixIcon: Icon(Icons.vpn_key)),
            ),
          ),
          SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
                color: Colors.pink, borderRadius: BorderRadius.circular(30)),
            height: 60,
            width: 300,
            child: Center(
              child: Text('LogIn',
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.5,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()));
              },
              child: Text('registers')),
          ElevatedButton(onPressed: () async {}, child: Text('FB LOGIN dev')),
          ElevatedButton(
              onPressed: () async {
                AuthClass().signWithGoogle().then((UserCredential value) {
                  final displayName = value.user!.displayName;
                  print(displayName);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SuccessScreen()));
                });
              },
              child: Text('Google LOGIN'))
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Login Button Pressed'),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}
