abstract class MoviesEvent {
  MoviesEvent();
}

class GetNowPlayingMoviesEvent extends MoviesEvent{}
class GetTopRatedMoviesEvent extends MoviesEvent{}
class GetPopularMoviesEvent extends MoviesEvent{}