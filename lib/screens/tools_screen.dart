import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'nmap_details_screen.dart';

class ToolsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> tools = [
    {
      'title': 'Nmap',
      'description': 'أداة لفحص الشبكات واستكشاف الخدمات والأجهزة.',
      'icon': FontAwesomeIcons.networkWired,
    },
    {
      'title': 'Wireshark',
      'description': 'أداة لتحليل بروتوكولات الشبكة والتقاط الحزم.',
      'icon': FontAwesomeIcons.solidChartBar,
    },
    {
      'title': 'Metasploit',
      'description': 'أداة لاختبار الاختراق واكتشاف الثغرات الأمنية.',
      'icon': FontAwesomeIcons.bug,
    },
    {
      'title': 'Burp Suite',
      'description': 'أداة لاختبار أمان تطبيقات الويب وتحليل حركة المرور.',
      'icon': FontAwesomeIcons.globe,
    },
    {
      'title': 'Nessus',
      'description': 'أداة لتقييم الثغرات الأمنية وإدارة أمان الشبكة.',
      'icon': FontAwesomeIcons.shieldAlt,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الأدوات الأمنية'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: tools.length,
        itemBuilder: (context, index) {
          return ToolCard(
            title: tools[index]['title']!,
            description: tools[index]['description']!,
            icon: tools[index]['icon']!,
          );
        },
      ),
    );
  }
}




class ToolCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  ToolCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FaIcon(
              icon,
              size: 40.0,
              color: Colors.teal,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        if (title == 'Nmap') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NmapDetailsScreen(),
                            ),
                          );
                        }
                      },
                      child: const Text('معرفة المزيد'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
