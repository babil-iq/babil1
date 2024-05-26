import 'package:flutter/material.dart';
import '../widgets/nav_bar.dart';
import '../widgets/search_bar.dart' as custom; // إضافة بادئة
import '../widgets/main_banner.dart';
import '../widgets/main_sections.dart';
import '../widgets/featured_content.dart';
import '../widgets/upcoming_events.dart';
import '../widgets/user_testimonials.dart';
import '../widgets/social_media_links.dart';
import '../widgets/footer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('بابل للأمن السيبراني'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            NavBar(),
            custom.SearchBar(), // استخدام البادئة هنا
            MainBanner(),
            MainSections(),
            FeaturedContent(),
            UpcomingEvents(),
            UserTestimonials(),
            SocialMediaLinks(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
