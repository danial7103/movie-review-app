import 'package:flutter/material.dart';
import 'form_page.dart';
import 'profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = [
      {
        "title": "Interstellar",
        "genre": "Sci-Fi",
        "rating": "9.0",
        "image": "assets/images/insterstellar.jpg",
      },
      {
        "title": "Joker",
        "genre": "Drama",
        "rating": "8.8",
        "image": "assets/images/joker.jpg",
      },
      {
        "title": "Batman",
        "genre": "Action",
        "rating": "8.5",
        "image": "assets/images/batman.jpg",
      },
      {
        "title": "Endgame",
        "genre": "Marvel",
        "rating": "9.2",
        "image": "assets/images/avengers.jpg",
      },
      {
        "title": "Fast X",
        "genre": "Racing",
        "rating": "7.9",
        "image": "assets/images/FastX.jpg",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF121212),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Welcome Back 👋",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 5),

                        Text(
                          "Discover amazing movies",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),

                      ],
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                          ),
                        );
                      },

                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.red,
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // FEATURED MOVIE
                Container(
                  height: 300,
                  width: double.infinity,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),

                    image: const DecorationImage(
                      image: AssetImage(
                        "assets/images/insterstellar_banner.jpg",
                      ),
                      fit: BoxFit.cover,
                      
                    ),
                  ),

                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),

                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,

                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent,
                        ],
                      ),
                    ),

                    padding: const EdgeInsets.all(20),

                    child: const Align(
                      alignment: Alignment.bottomLeft,

                      child: Text(
                        "Movie Of The Week\nInterstellar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "Trending Movies",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                // MOVIE CARDS
                SizedBox(
                  height: 390,

                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,

                    itemBuilder: (context, index) {

                      final movie = movies[index];

                      return Container(
                        width: 220,
                        margin: const EdgeInsets.only(right: 15),

                        child: Card(
                          color: const Color(0xFF1E1E1E),
                          elevation: 8,
                          clipBehavior: Clip.antiAlias,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              // POSTER
                              Image.asset(
                                movie["image"]!,
                                height: 250,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),

                              Padding(
                                padding: const EdgeInsets.all(12),

                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,

                                  children: [

                                    Text(
                                      movie["title"]!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight:
                                            FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 5),

                                    Text(
                                      movie["genre"]!,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),

                                    const SizedBox(height: 10),

                                    Row(
                                      children: [

                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 20,
                                        ),

                                        const SizedBox(width: 5),

                                        Text(
                                          movie["rating"]!,
                                          style:
                                              const TextStyle(
                                            color: Colors.white,
                                            fontWeight:
                                                FontWeight.bold,
                                          ),
                                        ),

                                        const Spacer(),

                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                            minimumSize: const Size(80, 35),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                          ),

                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => FormPage(
                                                  movieName: movie["title"]!,
                                                ),
                                              ),
                                            );
                                          },

                                          child: const Text(
                                            "Review",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}