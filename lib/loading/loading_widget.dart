import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Loading...',
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'IndieFlower',
        ),
      ),
    );
  }
}
