import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'session.dart';

class MyReviewsPage extends StatefulWidget {
  const MyReviewsPage({super.key});

  @override
  State<MyReviewsPage> createState() =>
      _MyReviewsPageState();
}

class _MyReviewsPageState
    extends State<MyReviewsPage> {

  List<Map<String, dynamic>> reviews = [];

  @override
  void initState() {
    super.initState();
    loadReviews();
  }

  Future<void> loadReviews() async {
  final data =
      await DatabaseHelper.instance.getUserReviews(
      Session.currentUserEmail,
    );

    setState(() {
      reviews = data;
    });
  }

      void showEditDialog(
      Map<String, dynamic> review,
    ) {
      final ratingController =
          TextEditingController(
        text: review['rating'].toString(),
      );

      final characterController =
          TextEditingController(
        text: review['favouriteCharacter'],
      );

      final reviewController =
          TextEditingController(
        text: review['review'],
      );

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Edit Review"),

            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  TextField(
                    controller: ratingController,
                    decoration: const InputDecoration(
                      labelText: "Rating",
                    ),
                  ),

                  TextField(
                    controller: characterController,
                    decoration: const InputDecoration(
                      labelText: "Favourite Character",
                    ),
                  ),

                  TextField(
                    controller: reviewController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: "Review",
                    ),
                  ),
                ],
              ),
            ),

            actions: [

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),

              ElevatedButton(
                onPressed: () async {

                  await DatabaseHelper.instance
                      .updateReview(
                    review['id'],
                    reviewController.text,
                    double.parse(
                      ratingController.text,
                    ),
                    characterController.text,
                  );

                  Navigator.pop(context);

                  loadReviews();
                },
                child: const Text("Save"),
              ),
            ],
          );
        },
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "My Reviews",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: reviews.isEmpty
          ? const Center(
              child: Text(
                "No Reviews Yet",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          : ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {

                final review = reviews[index];

                return Card(
                  color: const Color(0xFF1E1E1E),
                  margin: const EdgeInsets.all(10),

                  child: Padding(
                    padding: const EdgeInsets.all(15),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Text(
                          review['movieName'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          "⭐ ${review['rating']}",
                          style: const TextStyle(
                            color: Colors.amber,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          "Favourite Character: ${review['favouriteCharacter']}",
                          style: const TextStyle(
                            color: Colors.white70,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          review['review'],
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.orange,
                              ),
                              onPressed: () {
                                showEditDialog(review);
                              },
                            ),

                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () async {

                                await DatabaseHelper.instance
                                    .deleteReview(review['id']);

                                loadReviews();
                              },
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}