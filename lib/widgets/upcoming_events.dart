import 'package:flutter/material.dart';

class UpcomingEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'الأحداث القادمة',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          EventItem(),
          EventItem(),
          EventItem(),
        ],
      ),
    );
  }
}

class EventItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(Icons.event),
        title: Text('اسم الحدث'),
        subtitle: Text('تاريخ ومكان الحدث'),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Navigate to event details
        },
      ),
    );
  }
}
