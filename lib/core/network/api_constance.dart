class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "8ffaa203e0570d4ce2d6972a6329d6e9";

    // Endpoints
  static const String nowPlayingEndpoint = "/movie/now_playing";
  static const String popularEndpoint = "/movie/popular";
  static const String topRatedEndpoint = "/movie/top_rated";

  // Full URLs with API key
  static const String nowPlayingUrl = "$baseUrl$nowPlayingEndpoint?api_key=$apiKey";
  static const String popularUrl = "$baseUrl$popularEndpoint?api_key=$apiKey";
  static const String topRatedUrl = "$baseUrl$topRatedEndpoint?api_key=$apiKey";
}
