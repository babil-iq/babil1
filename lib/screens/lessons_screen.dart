import 'package:flutter/material.dart';

import 'course_details_screen.dart';

class LessonsScreen extends StatefulWidget {
  @override
  _LessonsScreenState createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  final List<Map<String, String>> lessons = [
    {
      'title': 'CompTIA A+',
      'description': 'تعلم الأساسيات لتصبح محترف دعم فني معتمد.',
      'image': 'https://via.placeholder.com/150',
      'status': 'soon',
    },
    {
      'title': 'CompTIA Network+',
      'description': 'تعلم كيفية تصميم وإدارة الشبكات.',
      'image': 'https://via.placeholder.com/150',
      'status': 'available',
    },
    {
      'title': 'CompTIA Security+',
      'description': 'تعرف على مبادئ الأمن السيبراني وأساسيات حماية البيانات.',
      'image': 'https://via.placeholder.com/150',
      'status': 'available',
    },
    {
      'title': 'Certified Ethical Hacker (CEH)',
      'description': 'اكتسب مهارات اختبار الاختراق والتحليل الأمني.',
      'image': 'https://via.placeholder.com/150',
      'status': 'available',
    },
    {
      'title': 'Cisco Certified Network Associate (CCNA)',
      'description': 'تعلم كيفية إعداد وإدارة شبكات Cisco.',
      'image': 'https://via.placeholder.com/150',
      'status': 'soon',
    },
    {
      'title': 'Certified Information Systems Security Professional (CISSP)',
      'description': 'تعرف على مهارات حماية الأنظمة والشبكات على مستوى متقدم.',
      'image': 'https://via.placeholder.com/150',
      'status': 'soon',
    },
    {
      'title': 'CompTIA Cloud+',
      'description': 'فهم كيفية إدارة الشبكات السحابية بفعالية.',
      'image': 'https://via.placeholder.com/150',
      'status': 'soon',
    },
    {
      'title': 'CompTIA PenTest+',
      'description': 'تعلم تقنيات اختبار الاختراق المتقدمة.',
      'image': 'https://via.placeholder.com/150',
      'status': 'soon',
    },
    {
      'title': 'Certified Information Security Manager (CISM)',
      'description': 'تعرف على إدارة برامج الأمن السيبراني.',
      'image': 'https://via.placeholder.com/150',
      'status': 'soon',
    },
    {
      'title': 'Certified Information Systems Auditor (CISA)',
      'description': 'اكتسب مهارات تدقيق أنظمة المعلومات.',
      'image': 'https://via.placeholder.com/150',
      'status': 'soon',
    },
    // يمكنك إضافة المزيد من الدروس هنا
  ];

  List<Map<String, String>> filteredLessons = [];

  @override
  void initState() {
    super.initState();
    filteredLessons = lessons;
  }

  void _filterLessons(String query) {
    final results = lessons.where((lesson) {
      final titleLower = lesson['title']!.toLowerCase();
      final descriptionLower = lesson['description']!.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          descriptionLower.contains(searchLower);
    }).toList();

    setState(() {
      filteredLessons = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الدروس'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) => _filterLessons(value),
              decoration: InputDecoration(
                labelText: 'ابحث عن الدروس',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredLessons.length,
              itemBuilder: (context, index) {
                return LessonCard(
                  title: filteredLessons[index]['title']!,
                  description: filteredLessons[index]['description']!,
                  imageUrl: filteredLessons[index]['image']!,
                  status: filteredLessons[index]['status']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LessonCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String status;

  LessonCard({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseDetailsScreen(
              title: title,
              description: description,
              imageUrl: imageUrl,
              status: status,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Card(
            margin: const EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15.0)),
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
                    style: const TextStyle(
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
                const SizedBox(height: 10.0),
              ],
            ),
          ),
          if (status == 'soon')
            Positioned(
              top: 20,
              right: 10,
              child: Transform.rotate(
                angle: -0.7, // زاوية الميلان بالراديان
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Soon',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

