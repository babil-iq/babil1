import 'package:flutter/material.dart';

class ForumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المنتدى'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text(
          'محتوى المنتدى',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
