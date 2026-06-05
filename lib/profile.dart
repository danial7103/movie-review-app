import 'package:flutter/material.dart';
import 'login.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: const Color(0xFF121212),
    body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              const SizedBox(height: 20),

              const CircleAvatar(
                radius: 70,
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.person,
                  size: 80,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Danial Haziq",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "movie@gmail.com",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 30),

              buildInfoCard(
                Icons.badge,
                "Student ID",
                "Your Student ID",
              ),

              const SizedBox(height: 15),

              buildInfoCard(
                Icons.school,
                "Course",
                "Mobile & Ubiquitous Computing",
              ),

              const SizedBox(height: 15),

              buildInfoCard(
                Icons.phone,
                "Phone",
                "+60 12-3456789",
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton.icon(
                  icon: const Icon(Icons.logout),
                  label: const Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),

                  onPressed: () {

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
          ),
        ),
      ),
    );
  }

  Widget buildInfoCard(
    IconData icon,
    String title,
    String value,
  ) {
    return Card(
      color: const Color(0xFF1E1E1E),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),

      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.red,
        ),

        title: Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),

        subtitle: Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}