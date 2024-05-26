import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الأخبار والتحليلات'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text(
          'محتوى الأخبار والتحليلات',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
