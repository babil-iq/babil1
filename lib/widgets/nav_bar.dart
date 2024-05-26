import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: Colors.teal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  NavBarItem(
                    title: 'الدروس',
                    icon: FontAwesomeIcons.book,
                    route: '/lessons',
                  ),
                  NavBarItem(
                    title: 'المختبرات الافتراضية',
                    icon: FontAwesomeIcons.flask,
                    route: '/labs',
                  ),
                  NavBarItem(
                    title: 'الأدوات الأمنية',
                    icon: FontAwesomeIcons.shieldAlt,
                    route: '/tools',
                  ),
                  NavBarItem(
                    title: 'التدريب والشهادات',
                    icon: FontAwesomeIcons.graduationCap,
                    route: '/training',
                  ),
                  NavBarItem(
                    title: 'المنتدى',
                    icon: FontAwesomeIcons.comments,
                    route: '/forum',
                  ),
                  NavBarItem(
                    title: 'الأخبار',
                    icon: FontAwesomeIcons.newspaper,
                    route: '/news',
                  ),
                  NavBarItem(
                    title: 'الأحداث',
                    icon: FontAwesomeIcons.calendarAlt,
                    route: '/events',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;

  NavBarItem({required this.title, required this.icon, required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.teal[700],
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            children: [
              FaIcon(
                icon,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(width: 5),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
