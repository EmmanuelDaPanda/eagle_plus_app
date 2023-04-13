import 'package:carousel_slider/carousel_slider.dart';
import 'package:eagle_plus_app/palette.dart';
import 'package:eagle_plus_app/widgets/movie_silde_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // sign out function
  void signOutOnTap() {
    FirebaseAuth.instance.signOut();
  }

  // BottomNavigationBar index
  int currentIndex = 0;

  // index of silder for dot indicator
  int sliderIndex = 0;

  // list of slider images
  final sliderImages = [
    "images/slider/arcane.jpeg",
    "images/slider/gray_man.jpeg",
    "images/slider/house_of_the_dragon.jpg",
    "images/slider/joker.jpg",
    "images/slider/turning_red.jpeg",
    "images/slider/your_name.jpg",
  ];

  // list of movie names
  final sliderMovieNames = [
    "Arcane",
    "The Gray Man",
    "House of the Dragon",
    "Joker",
    "Turning Red",
    "Your Name",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded),
          onPressed: () {},
        ),
        title: Image.asset(
          "images/icon/logo.png",
          alignment: Alignment.center,
          height: 40,
          fit: BoxFit.contain,
        ),
        actions: [
          IconButton(
            onPressed: signOutOnTap,
            icon: const Icon(Icons.logout),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.cast_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Palette.lightBrownAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.search_rounded,
                      color: Palette.whiteAccent,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Search",
                      style: TextStyle(color: Palette.whiteAccent),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // movie slide
            Column(
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1,
                    height: 170,
                    onPageChanged: (index, reason) {
                      setState(() {
                        sliderIndex = index;
                      });
                    },
                  ),
                  itemCount: sliderImages.length,
                  itemBuilder: (context, index, realIndex) {
                    // actual box
                    return MovieSlideBox(
                      sliderImage: sliderImages[index],
                      sliderMovieNames: sliderMovieNames[index],
                    );
                  },
                ),

                const SizedBox(height: 10),

                // dot indicator
                AnimatedSmoothIndicator(
                  activeIndex: sliderIndex,
                  count: sliderImages.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: Palette.white,
                    activeDotColor: Palette.white,
                    dotHeight: 5,
                    dotWidth: 5,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // movies text and divider
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: const [
                  Text(
                    "Movies",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Palette.white,
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              height: 50,
              decoration: const BoxDecoration(
                color: Palette.lightBrown,
              ),
            ),

            const SizedBox(height: 20),

            // tv shows text and divider
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: const [
                  Text(
                    "TV Shows",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Palette.white,
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
      
      bottomNavigationBar: Theme(
        data: ThemeData(canvasColor: Colors.black),
        child: BottomNavigationBar(
          selectedItemColor: Palette.gold,
          iconSize: 28,
          // selectedLabelStyle: const TextStyle(
          //   backgroundColor: Palette.goldAccent,
          // ),
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home_rounded),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search_rounded),
            ),
            BottomNavigationBarItem(
              label: "Downloads",
              icon: Icon(Icons.download_rounded),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person_outline_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
