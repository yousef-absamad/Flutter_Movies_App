class Movie {
  final int id;
  final String title;
  final String imageUrl;
  final List<int> genreIds;
  final String overView;
  final double voteAverage;
  final String releasData;

  const Movie({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.genreIds,
    required this.overView,
    required this.voteAverage,
    required this.releasData
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movie &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          imageUrl == other.imageUrl &&
          genreIds == other.genreIds &&
          overView == other.overView &&
          voteAverage == other.voteAverage &&
          releasData == other.releasData;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      imageUrl.hashCode ^
      genreIds.hashCode ^
      overView.hashCode ^
      voteAverage.hashCode ^
      releasData.hashCode;
}
