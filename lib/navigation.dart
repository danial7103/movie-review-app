import 'package:flutter/material.dart';
import 'home.dart';
import 'media.dart';
import 'profile.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  int selectedIndex = 0;

  final List<Widget> pages = [
  const HomePage(),
  const MediaPage(),
  const ProfilePage(),
];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,

        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: "Media",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),

        ],
      ),
    );
  }
}