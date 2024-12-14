class Show {
  final int id;
  final String name;
  final String url;
  final String language;
  final List<String> genres;
  final String status;
  final String? imageUrl;
  final String summary;
  final double score;
  final String? imdbId;
  final String? premiered;
  final String? ended;
  final String? networkName;
  final String? networkCountry;

  Show({
    required this.id,
    required this.name,
    required this.url,
    required this.language,
    required this.genres,
    required this.status,
    required this.imageUrl,
    required this.summary,
    required this.score,
    this.imdbId,
    this.premiered,
    this.ended,
    this.networkName,
    this.networkCountry,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['show']['id'],
      name: json['show']['name'],
      url: json['show']['url'],
      language: json['show']['language'],
      genres: List<String>.from(json['show']['genres']),
      status: json['show']['status'],
      imageUrl: json['show']['image']?['medium'],
      summary: json['show']['summary'],
      score: json['score'],
      imdbId: json['show']['externals']?['imdb'],
      premiered: json['show']['premiered'],
      ended: json['show']['ended'],
      networkName: json['show']['network']?['name'],
      networkCountry: json['show']['network']?['country']?['name'],
    );
  }
}
