import 'package:flutter/material.dart';

class LabsScreen extends StatelessWidget {
  final List<Map<String, String>> labs = [
    {
      'title': 'مختبر الشبكات الافتراضية',
      'description':
          'تعلم كيفية إعداد وإدارة الشبكات باستخدام محاكاة افتراضية.',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': 'مختبر اختراق التطبيقات',
      'description':
          'اكتسب مهارات اختبار اختراق التطبيقات باستخدام بيئات افتراضية.',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': 'مختبر تحليل البرامج الضارة',
      'description': 'تعلم كيفية تحليل واكتشاف البرامج الضارة في بيئة آمنة.',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': 'مختبر أمن الشبكات',
      'description':
          'فهم كيفية تأمين الشبكات واستخدام أدوات الحماية في بيئة افتراضية.',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': 'مختبر إدارة الأنظمة',
      'description':
          'اكتسب مهارات إدارة الأنظمة والتعامل مع الأنظمة التشغيلية المختلفة.',
      'image': 'https://via.placeholder.com/150',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المختبرات الافتراضية'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: labs.length,
        itemBuilder: (context, index) {
          return LabCard(
            title: labs[index]['title']!,
            description: labs[index]['description']!,
            imageUrl: labs[index]['image']!,
          );
        },
      ),
    );
  }
}

class LabCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  LabCard({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 150.0,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  // Add your navigation or functionality here
                },
                child: Text('عرض المختبر'),
              ),
              TextButton(
                onPressed: () {
                  // Add your navigation or functionality here
                },
                child: Text('ابدأ التجربة'),
              ),
            ],
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
