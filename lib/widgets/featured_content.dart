import 'package:flutter/material.dart';

class FeaturedContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'المحتوى المميز',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          FeaturedItem(),
          FeaturedItem(),
          FeaturedItem(),
        ],
      ),
    );
  }
}

class FeaturedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: SizedBox(
          width: 50,
          height: 50,
          child: Image.network(
              'https://img.freepik.com/free-photo/3d-internet-secuirty-badge_1048-18106.jpg?w=740&t=st=1716707297~exp=1716707897~hmac=0b4c1b218e6395c7befb1dbd5ec7e67bf54c56f315b960036a38b4d6ccfb1d59'), // استبدل بالرابط الفعلي
        ),
        title: const Text('عنوان المحتوى المميز'),
        subtitle: const Text('وصف مختصر للمحتوى المميز'),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          // Navigate to detailed view
        },
      ),
    );
  }
}
