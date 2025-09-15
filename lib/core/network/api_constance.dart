import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstance {
  static final String baseUrl = dotenv.env['BASE_URL'] ?? "";
  static final String apiKey = dotenv.env['API_KEY'] ?? "";
  static final String baseIamgeUrl = dotenv.env['IMAGE_BASE_URL'] ?? "";

  // Endpoints
  static const String nowPlayingEndpoint = "/movie/now_playing";
  static const String popularEndpoint = "/movie/popular";
  static const String topRatedEndpoint = "/movie/top_rated";

  // Full URLs with API key
  static final String nowPlayingUrl = "$baseUrl$nowPlayingEndpoint?api_key=$apiKey";
  
  static String popularUrl(int pageNum) => "$baseUrl$popularEndpoint?api_key=$apiKey&page=$pageNum";
  
  static String topRatedUrl(int pageNum) => "$baseUrl$topRatedEndpoint?api_key=$apiKey&page=$pageNum";
  
  static String movieDetailsPath(int movieId) => "$baseUrl/movie/$movieId?api_key=$apiKey";
  
  static String movieRecommendationPath(int movieId) => "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static String imageUrl(String path) => '$baseIamgeUrl$path';
}
