import 'package:flutter/material.dart';

class MovieSlideBox extends StatelessWidget {
  final String sliderImage;
  final String sliderMovieNames;
  const MovieSlideBox({
    super.key,
    required this.sliderImage,
    required this.sliderMovieNames,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(sliderImage),
            fit: BoxFit.cover,
          ),
        ),
        // child: Column(
        //   children: [

        //     // const SizedBox(height: 200),

        //     Text(sliderMovieNames)
        //   ],
        // ),
      ),
    );
  }
}
