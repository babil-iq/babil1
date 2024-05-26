import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';

class NmapTestScreen extends StatefulWidget {
  @override
  _NmapTestScreenState createState() => _NmapTestScreenState();
}

class _NmapTestScreenState extends State<NmapTestScreen> {
  final TextEditingController _controller = TextEditingController();
  String _scanResult = '';
  bool _isLoading = false;

  Future<void> _performScan(BuildContext context) async {
    final target = _controller.text;
    if (target.isNotEmpty) {
      setState(() {
        _isLoading = true;
        _scanResult = '';
      });
      try {
        // استبدل '192.168.56.1' بعنوان IP الفعلي لجهاز الخادم
        final response = await http.post(
          Uri.parse('http://192.168.56.1:3000/scan'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'target': target}),
        );

        if (response.statusCode == 200) {
          setState(() {
            _scanResult = response.body;
            _isLoading = false;
          });
        } else {
          setState(() {
            _scanResult = 'حدث خطأ أثناء الفحص: ${response.body}';
            _isLoading = false;
          });
        }
      } catch (e) {
        setState(() {
          _scanResult = 'حدث خطأ أثناء الفحص: $e';
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('حدث خطأ أثناء الفحص: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى إدخال عنوان IP أو موقع')),
      );
    }
  }

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
        title: const Text('اختبار Nmap'),
        backgroundColor: Colors.teal,
        actions: [
          if (_scanResult.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.copy),
              onPressed: () => _copyToClipboard(context, _scanResult),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'أدخل عنوان IP او URL:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: ' IP او URL ',
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () => _performScan(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 16.0),
                  textStyle: const TextStyle(fontSize: 18.0),
                ),
                child: const Text('Scan'
                ,
                  style: TextStyle(
                    fontFamily: 'roboto',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _scanResult.isNotEmpty
                    ? Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SelectableText(
                              _scanResult,
                              style: const TextStyle(
                                fontFamily: 'Courier',
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
          ],
        ),
      ),
    );
  }
}
