import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NmapTestScreen extends StatefulWidget {
  @override
  _NmapTestScreenState createState() => _NmapTestScreenState();
}

class _NmapTestScreenState extends State<NmapTestScreen> {
  final TextEditingController _controller = TextEditingController();
  String _scanResult = '';
  bool _isLoading = false;

  final StreamController<double> _progressStreamController =
      StreamController<double>();

  @override
  void dispose() {
    _progressStreamController.close();
    super.dispose();
  }

  Future<void> _performScan(BuildContext context) async {
    final target = _controller.text;
    if (target.isNotEmpty) {
      setState(() {
        _isLoading = true;
        _scanResult = '';
      });

      try {
        StringBuffer results = StringBuffer();
        results.writeln('Scanning target: $target\n');

        // Perform OS detection
        results.writeln('Operating System Detection:');
        String osResult = await _detectOS(target);
        results.writeln(osResult);
        _progressStreamController.add(0.2);

        // Perform service detection on common ports
        results.writeln('\nService Detection:');
        List<int> ports = [21, 22, 23, 25, 80];
        for (int i = 0; i < ports.length; i++) {
          String serviceResult = await _detectService(target, ports[i]);
          results.writeln(serviceResult);
          _progressStreamController.add((i + 1) / ports.length * 0.8 + 0.2);
        }

        setState(() {
          _scanResult = results.toString();
          _isLoading = false;
        });
        _progressStreamController.add(1.0);
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

  Future<String> _detectOS(String target) async {
    // Dummy implementation for OS detection
    // Replace with actual implementation
    await Future.delayed(const Duration(seconds: 2));
    return 'OS detection is not implemented.';
  }

  Future<String> _detectService(String target, int port,
      {Duration timeout = const Duration(seconds: 5)}) async {
    try {
      Socket socket = await Socket.connect(target, port, timeout: timeout);
      socket.destroy();
      return 'Port $port: Open (Service detection is not implemented)';
    } catch (e) {
      return 'Port $port: Closed';
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
    return Theme(
      data: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFF121212),
        hintColor: Colors.tealAccent,
        fontFamily: 'Monospace',
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('اختبار Nmap'),
          backgroundColor: Colors.black,
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
                  color: Colors.tealAccent,
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _controller,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.tealAccent),
                  ),
                  labelText: ' IP او URL ',
                  labelStyle: TextStyle(color: Colors.tealAccent),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.tealAccent),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () => _performScan(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.tealAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 16.0),
                    textStyle:
                        const TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  child: const Text(
                    'Scan',
                    style: TextStyle(
                      fontFamily: 'Monospace',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              _isLoading
                  ? StreamBuilder<double>(
                      stream: _progressStreamController.stream,
                      builder: (context, snapshot) {
                        return Column(
                          children: [
                            CircularProgressIndicator(
                              value: snapshot.data,
                              backgroundColor: Colors.grey[300],
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.tealAccent),
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              '${(snapshot.data ?? 0) * 100}% Completed',
                              style: const TextStyle(
                                  fontSize: 16.0, color: Colors.tealAccent),
                            ),
                          ],
                        );
                      },
                    )
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
                                  fontFamily: 'Monospace',
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
      ),
    );
  }
}
