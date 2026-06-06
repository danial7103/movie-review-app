import 'package:flutter/material.dart';
import 'database_helper.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<Map<String, dynamic>> users = [];

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  Future<void> loadUsers() async {
    final data =
        await DatabaseHelper.instance.getAllUsers();

    setState(() {
      users = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Registered Users",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme:
            const IconThemeData(color: Colors.white),
      ),

      body: users.isEmpty
          ? const Center(
              child: Text(
                "No Users Found",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          : ListView.builder(
              itemCount: users.length,

              itemBuilder: (context, index) {
                return Card(
                  color: const Color(0xFF1E1E1E),
                  margin: const EdgeInsets.all(10),

                  child: ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.red,
                    ),

                    title: Text(
                      users[index]['name'],
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),

                    subtitle: Text(
                      users[index]['email'],
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}