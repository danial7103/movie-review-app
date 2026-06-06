import 'package:flutter/material.dart';
import 'signup.dart';
import 'navigation.dart';
import 'session.dart';
import 'database_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginUser() async {
      String email = emailController.text;
      String password = passwordController.text;

      bool userExists =
          await DatabaseHelper.instance.loginUser(
        email,
        password,
      );

      if (userExists) {

        Session.currentUserEmail = email;
        print("Logged in user: ${Session.currentUserEmail}");

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const NavigationPage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Invalid Email or Password",
            ),
          ),
        );
      }
    }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: Center(

          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Icon(
                    Icons.movie,
                    color: Colors.red,
                    size: 100,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Movie Review App",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Review your favourite movies",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 40),

                  TextField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.white),

                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[900],

                      labelText: "Email",
                      labelStyle: const TextStyle(color: Colors.white),

                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.red,
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),

                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[900],

                      labelText: "Password",
                      labelStyle: const TextStyle(color: Colors.white),

                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.red,
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 55,

                    child: ElevatedButton(
                      onPressed: loginUser,

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),

                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const SignUpPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Don't have an account? Sign Up",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}