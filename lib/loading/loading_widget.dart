import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    List<String> categories = await Future.delayed(Duration(seconds: 5), () {
      return ['Animal', 'Transport'];
    });

    Navigator.pushReplacementNamed(context, '/game', arguments: { categories: categories });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Loading...',
        style: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
          letterSpacing: 2,
          color: Colors.orange[500],
          fontFamily: 'IndieFlower',
        ),
      ),
    );
  }
}
