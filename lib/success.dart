import 'package:flutter/material.dart';
import 'package:longinapp/auth_provider.dart';

class SuccessScreen extends StatefulWidget {
  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                AuthClass().signOut();
              },
              child: Container(
                width: 100,
                height: 50,
                color: Colors.pink,
                child: Text('logout'),
              ))
        ],
      ),
    );
  }
}
