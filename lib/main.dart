import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/lessons_screen.dart';
import 'screens/labs_screen.dart';
import 'screens/tools_screen.dart';
import 'screens/training_screen.dart';
import 'screens/forum_screen.dart';
import 'screens/news_screen.dart';
import 'screens/events_screen.dart';

void main() {
  runApp(BabelApp());
}

class BabelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'بابل للأمن السيبراني',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/lessons': (context) => LessonsScreen(),
        '/labs': (context) => LabsScreen(),
        '/tools': (context) => ToolsScreen(),
        '/training': (context) => TrainingScreen(),
        '/forum': (context) => ForumScreen(),
        '/news': (context) => NewsScreen(),
        '/events': (context) => EventsScreen(),
      },
    );
  }
}
