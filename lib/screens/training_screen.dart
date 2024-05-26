import 'package:flutter/material.dart';

class TrainingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('التدريب والشهادات'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text(
          'محتوى التدريب والشهادات',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
