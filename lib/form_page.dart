import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  final String movieName;

  const FormPage({
    super.key,
    required this.movieName,
  });

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController movieController;
  final ratingController = TextEditingController();
  final characterController = TextEditingController();
  final commentController = TextEditingController();

  @override
  void initState() {
    super.initState();

    movieController =
        TextEditingController(text: widget.movieName);
  }

  @override
  void dispose() {
    movieController.dispose();
    ratingController.dispose();
    characterController.dispose();
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),

      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Write Review",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "Submit Your Review ⭐",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Share your thoughts about this movie",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 30),

              // MOVIE NAME
              TextFormField(
                controller: movieController,
                readOnly: true,

                style: const TextStyle(
                  color: Colors.white,
                ),

                decoration: InputDecoration(
                  labelText: "Movie Name",

                  labelStyle: const TextStyle(
                    color: Colors.grey,
                  ),

                  prefixIcon: const Icon(
                    Icons.movie,
                    color: Colors.red,
                  ),

                  filled: true,
                  fillColor: const Color(0xFF1E1E1E),

                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // RATING
              buildTextField(
                controller: ratingController,
                label: "Rating (1-10)",
                icon: Icons.star,
              ),

              const SizedBox(height: 20),

              // CHARACTER
              buildTextField(
                controller: characterController,
                label: "Favourite Character",
                icon: Icons.person,
              ),

              const SizedBox(height: 20),

              // COMMENT
              buildTextField(
                controller: commentController,
                label: "Comment",
                icon: Icons.comment,
                maxLines: 4,
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),

                  onPressed: () {
                    if (_formKey.currentState!
                        .validate()) {

                      showDialog(
                        context: context,

                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              "Review Submitted",
                            ),

                            content: Text(
                              "Your review for ${widget.movieName} has been submitted successfully!",
                            ),

                            actions: [

                              TextButton(
                                onPressed: () {
                                  Navigator.pop(
                                      context);
                                },

                                child: const Text(
                                  "OK",
                                ),
                              ),

                            ],
                          );
                        },
                      );
                    }
                  },

                  child: const Text(
                    "Submit Review",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,

      style: const TextStyle(
        color: Colors.white,
      ),

      decoration: InputDecoration(
        labelText: label,

        labelStyle: const TextStyle(
          color: Colors.grey,
        ),

        prefixIcon: Icon(
          icon,
          color: Colors.red,
        ),

        filled: true,
        fillColor: const Color(0xFF1E1E1E),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),

      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter $label";
        }

        return null;
      },
    );
  }
}