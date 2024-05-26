import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الأحداث القادمة'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text(
          'محتوى الأحداث القادمة',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
