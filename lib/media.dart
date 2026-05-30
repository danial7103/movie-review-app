import 'package:flutter/material.dart';

class MediaPage extends StatelessWidget {
  const MediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = [
      {
        "title": "Interstellar",
        "genre": "Sci-Fi Adventure",
        "image": "assets/images/insterstellar.jpg",
      },
      {
        "title": "Joker",
        "genre": "Psychological Drama",
        "image": "assets/images/joker.jpg",
      },
      {
        "title": "Batman",
        "genre": "Action Thriller",
        "image": "assets/images/batman.jpg",
      },
      {
        "title": "Avengers Endgame",
        "genre": "Superhero Action",
        "image": "assets/images/avengers.jpg",
      },
      {
        "title": "Fast X",
        "genre": "Racing Action",
        "image": "assets/images/FastX.jpg",
      },
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Movie Library 🎬",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "Browse all available movies",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: movies.length,

                itemBuilder: (context, index) {

                  return Card(
                    color: const Color(0xFF1E1E1E),
                    margin: const EdgeInsets.only(bottom: 15),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: ListTile(

                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),

                        child: Image.asset(
                          movies[index]["image"]!,
                          width: 60,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),

                      title: Text(
                        movies[index]["title"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      subtitle: Text(
                        movies[index]["genre"]!,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),

                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}