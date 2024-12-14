import 'package:flutter/material.dart';
import 'package:quadb_tech_movie_app/models/movie_model.dart';
import 'package:quadb_tech_movie_app/services/api_service.dart';
import 'package:quadb_tech_movie_app/widgets/movie_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Show>> _shows;

  @override
  void initState() {
    super.initState();
    _shows = ApiService().fetchShows();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Movie App')),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.search),
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => SearchScreen()),
        //       );
        //     },
        //   ),
        // ],
      ),
      body: FutureBuilder<List<Show>>(
        future: _shows,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No Movies Found'));
          } else {
            final shows = snapshot.data!;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
              ),
              itemCount: shows.length,
              itemBuilder: (context, index) {
                return MovieCard(show: shows[index]);
              },
            );
          }
        },
      ),
    );
  }
}
