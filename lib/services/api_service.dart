import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quadb_tech_movie_app/models/movie_model.dart';

class ApiService {
  final String baseUrl = 'https://api.tvmaze.com/search/shows?q=';

  Future<List<Show>> fetchShows() async {
    final response = await http.get(Uri.parse(baseUrl + 'all'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Show.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load shows');
    }
  }

  Future<List<Show>> searchShows(String query) async {
    final response = await http.get(Uri.parse(baseUrl + query));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Show.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load search results');
    }
  }
}
