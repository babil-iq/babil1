import 'package:flutter/material.dart';

class UserTestimonials extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'مراجعات المستخدمين',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          TestimonialItem(),
          TestimonialItem(),
          TestimonialItem(),
        ],
      ),
    );
  }
}

class TestimonialItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text('اسم المستخدم'),
        subtitle: Text('مراجعة المستخدم'),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Show full testimonial
        },
      ),
    );
  }
}
