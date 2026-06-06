import 'package:flutter/material.dart';
import 'login.dart';
import 'users_page.dart';
import 'session.dart';
import 'database_helper.dart';
import 'my_reviews.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String userName = '';
  String userEmail = '';

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final user =
        await DatabaseHelper.instance.getUserByEmail(
      Session.currentUserEmail,
    );

    if (user != null) {
      setState(() {
        userName = user['name'];
        userEmail = user['email'];
      });
    }
  }

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

                Text(
                  userName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  Session.currentUserEmail,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 30),

                buildInfoCard(
                Icons.email,
                "Email",
                userEmail,
                ),

                buildInfoCard(
                Icons.person,
                "Account Type",
                Session.currentUserEmail == "admin@gmail.com"
                  ? "Administrator"
                  : "User",
                ),

                const SizedBox(height: 15),

                buildInfoCard(
                  Icons.phone,
                  "Phone",
                  "+60 12-3456789",
                ),

              const SizedBox(height: 20),

                // VIEW USERS BUTTON
                if (Session.currentUserEmail == "admin@gmail.com")
                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UsersPage(),
                        ),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),

                    child: const Text(
                      "VIEW USERS",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const MyReviewsPage(),
                        ),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),

                    child: const Text(
                      "MY REVIEWS",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              const SizedBox(height: 15),

                // LOGOUT BUTTON
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
                        fontWeight: FontWeight.bold,
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