import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('About this application...'),
          centerTitle: true,
          backgroundColor: Colors.orange[700],
        ),
        body: Center(
          child: Text(
            'About this application...',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'IndieFlower',
            ),
          ),
        ));
  }
}
