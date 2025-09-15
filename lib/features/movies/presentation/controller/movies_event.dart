abstract class MoviesEvent {
  MoviesEvent();
}

class GetNowPlayingMoviesEvent extends MoviesEvent {}

class GetTopRatedMoviesEvent extends MoviesEvent {
  final int pageNum;
  GetTopRatedMoviesEvent({this.pageNum = 1});
}

class GetPopularMoviesEvent extends MoviesEvent {
  final int pageNum;
  GetPopularMoviesEvent({this.pageNum = 1});
}
