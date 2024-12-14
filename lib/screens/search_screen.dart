import 'package:flutter/material.dart';
import 'package:quadb_tech_movie_app/models/movie_model.dart';
import 'package:quadb_tech_movie_app/services/api_service.dart';
import 'package:quadb_tech_movie_app/widgets/movie_card.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _controller;
  late Future<List<Show>> _searchResults;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _searchResults = Future.value([]); // Initialize with an empty list
  }

  void _onSearch() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _searchResults = ApiService().searchShows(_controller.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Movies'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Search for movies...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _onSearch,
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Show>>(
              future: _searchResults,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No Results Found'));
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
          ),
        ],
      ),
    );
  }
}
