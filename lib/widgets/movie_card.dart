import 'package:flutter/material.dart';
import 'package:quadb_tech_movie_app/models/movie_model.dart';
import 'package:quadb_tech_movie_app/screens/details_screen.dart';

class MovieCard extends StatelessWidget {
  final Show show;

  MovieCard({required this.show});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(show: show),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        color: Colors.grey[900], // Background color for the card
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie Image
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: show.imageUrl != null
                  ? Image.network(
                      show.imageUrl!,
                      height: 240,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/placeholder.png', // Placeholder image if no image URL
                      height: 240,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),

            // Movie Premiere Date
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                show.premiered ?? 'Date Unknown',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
