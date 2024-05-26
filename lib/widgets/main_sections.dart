import 'package:flutter/material.dart';

class MainSections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SectionItem(
          title: 'الدروس والمقالات التعليمية',
          description: 'تعلم مهارات الأمن السيبراني مع أحدث الدروس والمقالات.',
        ),
        SectionItem(
          title: 'المختبرات الافتراضية',
          description: 'اختبر مهاراتك في بيئات مختبرية تفاعلية.',
        ),
        SectionItem(
          title: 'الأدوات الأمنية',
          description: 'اكتشف الأدوات الأمنية واستخداماتها.',
        ),
        SectionItem(
          title: 'التدريب والشهادات',
          description: 'احصل على التدريب اللازم للشهادات المعترف بها.',
        ),
        SectionItem(
          title: 'المنتدى',
          description: 'تواصل مع خبراء الأمن السيبراني.',
        ),
        SectionItem(
          title: 'الأخبار والتحليلات',
          description: 'اطلع على آخر أخبار الأمن السيبراني والتحليلات.',
        ),
      ],
    );
  }
}

class SectionItem extends StatelessWidget {
  final String title;
  final String description;

  SectionItem({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(description),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            // Navigate to respective section
          },
        ),
      ),
    );
  }
}
