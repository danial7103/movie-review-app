import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'form_page.dart';
import 'profile.dart';
import 'login.dart';
import 'movie_details.dart';

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

    return Container(
      color: const Color(0xFF121212),

      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // HEADER
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [

                    const Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back 👋",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
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

                    PopupMenuButton<String>(
                    color: const Color(0xFF1E1E1E),
                    offset: const Offset(0, 60),

                    onSelected: (value) {
                      switch (value) {
                        case 'profile':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfilePage(),
                            ),
                          );
                          break;

                        case 'settings':
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Settings page coming soon'),
                            ),
                          );
                          break;

                        case 'logout':
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Logout'),
                            content: const Text(
                              'Are you sure you want to logout?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel'),
                              ),

                              TextButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                child: const Text('Logout'),
                              ),
                            ],
                          ),
                        );
                        break;
                      }
                    },

                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'profile',
                        child: Row(
                          children: const [
                            Icon(Icons.person, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              'My Profile',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),

                      const PopupMenuItem(
                        value: 'settings',
                        child: Row(
                          children: [
                            Icon(Icons.settings, color: Colors.white),
                            SizedBox(width: 10),
                            Text('Settings',
                                style: TextStyle(color: Colors.white) 
                                ),
                          ],
                        ),
                      ),

                      const PopupMenuItem(
                        value: 'logout',
                        child: Row(
                          children: [
                            Icon(Icons.logout, color: Colors.red),
                            SizedBox(width: 10),
                            Text('Logout',
                                style: TextStyle(color: Colors.red) 
                                ),
                          ],
                        ),
                      ),
                    ],

                    child: const CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ],
                ),

                const SizedBox(height: 25),

                // FEATURED MOVIES
                const Text(
                  "Featured Movies 🎬",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                CarouselSlider(
                  options: CarouselOptions(
                    height: 220,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.95,
                    autoPlayInterval:
                        const Duration(seconds: 4),
                  ),

                  items: [

                  movieBanner(
                    context,
                    "assets/gif/intersteller.gif",
                    "Interstellar",
                    "In a dystopian future where Earth's crops are failing and dust storms are destroying humanity, a former NASA pilot named Cooper leaves his family to lead a crew through a wormhole. Their mission is to find a habitable exoplanet and ensure the survival of the human race.",
                  ),

                  movieBanner(
                    context,
                    "assets/gif/joker.gif",
                    "Joker",
                    "The 2019 film Joker follows Arthur Fleck, a mentally ill and impoverished party clown in 1980s Gotham City. Ostracized by society and suffering from a condition that causes him to laugh uncontrollably, Arthur's descent into madness and violence sparks a deadly counter-cultural revolution.",
                  ),

                  movieBanner(
                    context,
                    "assets/gif/batman.gif",
                    "Batman",
                    "The Batman follows Bruce Wayne as he investigates the Riddler's murders while uncovering corruption throughout Gotham City and secrets connected to his family.",
                  ),

                  movieBanner(
                    context,
                    "assets/gif/avengers endgame.gif",
                    "Avengers Endgame",
                    "The surviving Avengers unite to reverse Thanos' snap and restore half of all life in the universe through a daring time-travel mission.",
                  ),

                  movieBanner(
                    context,
                    "assets/gif/fastx-the-fast-saga.gif",
                    "Fast X",
                    "Dom Toretto and his family face Dante Reyes, a dangerous enemy seeking revenge and determined to destroy everything Dom loves.",
                  ),
                ],
                ),

                const SizedBox(height: 25),

                const Text(
                  "Trending Movies",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  height: 360,

                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,

                    itemBuilder: (context, index) {

                      final movie = movies[index];

                      return Container(
                        width: 170,
                        margin:
                            const EdgeInsets.only(right: 12),

                        child: Card(
                          color: const Color(0xFF1E1E1E),
                          elevation: 5,
                          clipBehavior: Clip.antiAlias,

                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20),
                          ),

                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [

                              Image.asset(
                                movie["image"]!,
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),

                              Padding(
                                padding:
                                    const EdgeInsets.all(10),

                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      movie["title"]!,
                                      maxLines: 1,
                                      overflow:
                                          TextOverflow.ellipsis,
                                      style:
                                          const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight:
                                            FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 4),

                                    Text(
                                      movie["genre"]!,
                                      style:
                                          const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    Row(
                                      children: [

                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 18,
                                        ),

                                        const SizedBox(width: 4),

                                        Text(
                                          movie["rating"]!,
                                          style:
                                              const TextStyle(
                                            color: Colors.white,
                                            fontWeight:
                                                FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 10),

                                    SizedBox(
                                      width: double.infinity,
                                      height: 35,

                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) =>
                                                      FormPage(
                                                movieName:
                                                    movie[
                                                        "title"]!,
                                              ),
                                            ),
                                          );
                                        },

                                        style:
                                            ElevatedButton
                                                .styleFrom(
                                          backgroundColor:
                                              Colors.red,
                                        ),

                                        child: const Text(
                                          "Review",
                                          style: TextStyle(
                                            color:
                                                Colors.white,
                                          ),
                                        ),
                                      ),
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

Widget movieBanner(
  BuildContext context,
  String image,
  String title,
  String synopsis,
) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetailsPage(
            title: title,
            image: image,
            synopsis: synopsis,
          ),
        ),
      );
    },

    child: Container(
      width: MediaQuery.of(context).size.width,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black87,
              Colors.transparent,
            ],
          ),
        ),

        padding: const EdgeInsets.all(20),

        child: Align(
          alignment: Alignment.bottomLeft,

          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}