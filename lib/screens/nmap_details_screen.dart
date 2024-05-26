import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'nmap_test_screen.dart'; // استيراد صفحة اختبار Nmap

class NmapDetailsScreen extends StatelessWidget {
  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم نسخ النص إلى الحافظة')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nmap'),
        backgroundColor: Colors.teal,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NmapTestScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                'https://nmap.org/images/nmap-logo-256x256.png', // استبدل بالرابط الفعلي للصورة
                fit: BoxFit.cover,
                width: 200,
                height: 200.0,
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Nmap',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Nmap هي أداة لفحص الشبكات واستكشاف الخدمات والأجهزة.',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'المميزات:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                '• فحص الشبكات واكتشاف الأجهزة المتصلة.\n'
                '• اكتشاف الخدمات المفتوحة على الأجهزة.\n'
                '• دعم للبروتوكولات المتعددة.\n'
                '• دعم للبرمجيات النصية لاكتشاف الثغرات.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'طريقة الاستخدام:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              _buildCommandSection(
                  context,
                  'لتثبيت Nmap:',
                  '• على Linux: sudo apt-get install nmap\n'
                      '• على macOS: brew install nmap\n'
                      '• على Windows: قم بتحميل المثبت من الموقع الرسمي.'),
              const SizedBox(height: 16.0),
              _buildCommandSection(context, 'لاستخدام Nmap لفحص شبكة محلية:',
                  'nmap -sP 192.168.1.0/24'),
              const SizedBox(height: 16.0),
              _buildCommandSection(context, 'لاستخدام Nmap لفحص منفذ معين:',
                  'nmap -p 80 192.168.1.1'),
              const SizedBox(height: 16.0),
              _buildCommandSection(context,
                  'لاستخدام Nmap لاكتشاف نظام التشغيل:', 'nmap -O 192.168.1.1'),
              const SizedBox(height: 16.0),
              _buildCommandSection(context, 'لاستخدام Nmap لفحص جميع المنافذ:',
                  'nmap -p- 192.168.1.1'),
              const SizedBox(height: 16.0),
              _buildCommandSection(context, 'لاستخدام Nmap لفحص نطاق IP معين:',
                  'nmap 192.168.1.0/24'),
              const SizedBox(height: 16.0),
              _buildCommandSection(context, 'لاستخدام Nmap لفحص TCP SYN:',
                  'nmap -sS 192.168.1.1'),
              const SizedBox(height: 16.0),
              _buildCommandSection(
                  context, 'لاستخدام Nmap لفحص UDP:', 'nmap -sU 192.168.1.1'),
              const SizedBox(height: 16.0),
              _buildCommandSection(
                  context,
                  'لاستخدام Nmap لفحص الأجهزة مع اكتشاف النظام:',
                  'nmap -A 192.168.1.1'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCommandSection(
      BuildContext context, String title, String command) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: Colors.green),
          ),
          child: Row(
            children: [
              Expanded(
                child: SelectableText(
                  command,
                  style: const TextStyle(
                    fontFamily: 'Courier',
                    fontSize: 13.0,
                    color: Colors.green,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () => _copyToClipboard(context, command),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
