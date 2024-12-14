import 'package:flutter/material.dart';
import 'package:quadb_tech_movie_app/models/movie_model.dart';

class DetailsScreen extends StatelessWidget {
  final Show show;

  DetailsScreen({required this.show});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          show.name,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.white), 
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: show.imageUrl != null
                      ? Image.network(
                          show.imageUrl!,
                          height: 300,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        )
                      : Image.asset(
                          'assets/placeholder.png',
                          height: 300,
                          width: double.infinity,
                          fit: BoxFit.contain, 
                        ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                show.summary,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.6),
              ),
            ),
            
            // Divider for sections
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Divider(
                color: Colors.white24,
                thickness: 1.5,
              ),
            ),
            
            // Network Name (if available)
            if (show.networkName != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Network: ${show.networkName}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            
            // Divider between sections
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Divider(
                color: Colors.white24,
                thickness: 1.5,
              ),
            ),

            // Premiere Date (if available)
            if (show.premiered != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Premiered: ${show.premiered}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
