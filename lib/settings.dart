import 'package:flutter/material.dart';
import 'session.dart';
import 'login.dart';

class SettingsPage extends StatefulWidget {
const SettingsPage({super.key});

@override
State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
bool notifications = true;

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(0xFF121212),

  appBar: AppBar(
    backgroundColor: Colors.red,
    title: const Text(
      "Settings",
      style: TextStyle(color: Colors.white),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),

  body: ListView(
    padding: const EdgeInsets.all(20),

    children: [

      // ACCOUNT
      const Text(
        "Account",
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 15),

      Card(
        color: const Color(0xFF1E1E1E),
        child: ListTile(
          leading: const Icon(
            Icons.email,
            color: Colors.red,
          ),
          title: const Text(
            "Logged In Email",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          subtitle: Text(
            Session.currentUserEmail,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),

      const SizedBox(height: 25),

      // NOTIFICATIONS
      const Text(
        "Preferences",
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 15),

      Card(
        color: const Color(0xFF1E1E1E),
        child: SwitchListTile(
          activeColor: Colors.red,
          value: notifications,
          onChanged: (value) {
            setState(() {
              notifications = value;
            });
          },
          title: const Text(
            "Notifications",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          subtitle: const Text(
            "Receive app notifications",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ),

      const SizedBox(height: 25),

      // ABOUT
      const Text(
        "About",
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 15),

      Card(
        color: const Color(0xFF1E1E1E),
        child: const ListTile(
          leading: Icon(
            Icons.info,
            color: Colors.red,
          ),
          title: Text(
            "Movie Review App",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            "Version 1.0\nCreated for Mobile Development Project",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ),

      const SizedBox(height: 40),

      // LOGOUT
      SizedBox(
        width: double.infinity,
        height: 55,

        child: ElevatedButton.icon(
          icon: const Icon(Icons.logout),
          label: const Text(
            "Logout",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),

          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),

          onPressed: () {

            Session.currentUserEmail = "";

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const LoginPage(),
              ),
              (route) => false,
            );
          },
        ),
      ),
    ],
  ),
);

}
}
