import 'package:flutter/material.dart';

class CourseDetailsScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String status;

  CourseDetailsScreen({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> sections = [
      {'title': 'مقدمة في $title', 'content': 'نظرة عامة على الدورة وأهدافها.'},
      {
        'title': 'أجهزة الكمبيوتر',
        'content': 'تعرف على مكونات الكمبيوتر وأنواعه المختلفة.'
      },
      {
        'title': 'أنظمة التشغيل',
        'content': 'مقدمة إلى أنظمة التشغيل المختلفة وكيفية تثبيتها.'
      },
      {'title': 'الشبكات', 'content': 'أساسيات الشبكات وكيفية إعدادها.'},
      {
        'title': 'الأمن السيبراني',
        'content': 'مبادئ الأمن السيبراني وكيفية حماية البيانات.'
      },
    ];

    final List<Map<String, dynamic>> reviews = [
      {
        'username': 'User 1',
        'review': 'دورة رائعة تعلمت الكثير.',
        'rating': 5,
      },
      {
        'username': 'User 2',
        'review': 'معلومات مفيدة وشرح ممتاز.',
        'rating': 4,
      },
      // يمكنك إضافة المزيد من التقييمات هنا
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.black54,
                ),
              ),
            ),
            if (status == 'soon')
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0),
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
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'متطلبات الدورة',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '• لا يتطلب أي خبرة مسبقة\n• جهاز كمبيوتر واتصال بالإنترنت',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black54,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'فصول الدورة',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...sections.map((section) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          section['title']!,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          section['content']!,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'تقييمات المستخدمين',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...reviews.map((review) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          review['username']!,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: List.generate(
                            review['rating'],
                            (index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          review['review']!,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
