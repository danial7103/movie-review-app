import 'package:flutter/material.dart';
import 'movie_details.dart';

class MediaPage extends StatelessWidget {
  const MediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = [
      {
        "title": "Interstellar",
        "genre": "Sci-Fi Adventure",
        "image": "assets/images/insterstellar.jpg",
        "synopsis":
            "In a dystopian future where Earth's crops are failing and dust storms are destroying humanity, a former NASA pilot named Cooper leaves his family to lead a crew through a wormhole. Their mission is to find a habitable exoplanet and ensure the survival of the human race.",
      },
      {
        "title": "Joker",
        "genre": "Psychological Drama",
        "image": "assets/images/joker.jpg",
        "synopsis":
            "The 2019 film Joker follows Arthur Fleck, a mentally ill and impoverished party clown in 1980s Gotham City. Ostracized by society and suffering from a condition that causes him to laugh uncontrollably, Arthur's descent into madness and violence sparks a deadly counter-cultural revolution.",
      },
      {
        "title": "Batman",
        "genre": "Action Thriller",
        "image": "assets/images/batman.jpg",
        "synopsis":
            "The Batman (2022) follows reclusive billionaire Bruce Wayne during his second year of fighting crime in Gotham City. Posing as a brutal vigilante known as Vengeance, he must team up with allies to track down the Riddler while uncovering dark secrets linked to his family's legacy.",
      },
      {
        "title": "Avengers Endgame",
        "genre": "Superhero Action",
        "image": "assets/images/avengers.jpg",
        "synopsis":
            "In Avengers: Endgame (2019), the surviving Avengers band together to reverse the catastrophic snap caused by Thanos, which wiped out half of all life in the universe. By utilizing time travel through the Quantum Realm, they gather the Infinity Stones and face a final battle against Thanos.",
      },
      {
        "title": "Fast X",
        "genre": "Racing Action",
        "image": "assets/images/FastX.jpg",
        "synopsis":
            "Dom Toretto and his family are targeted by Dante Reyes, the vengeful son of a slain Brazilian drug lord. Fueled by a 12-year-old blood vendetta, Dante plots to destroy everything and everyone Dom loves.",
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailsPage(
                              title: movies[index]["title"] as String,
                              image: movies[index]["image"] as String,
                              synopsis:
                                  movies[index]["synopsis"] as String,
                            ),
                          ),
                        );
                      },

                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          movies[index]["image"] as String,
                          width: 60,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),

                      title: Text(
                        movies[index]["title"] as String,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      subtitle: Text(
                        movies[index]["genre"] as String,
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