import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'About this application...',
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'IndieFlower',
        ),
      ),
    );
  }
}
