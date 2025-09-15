import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/core/routing/app_routes.dart';
import 'package:flutter_movies/core/services/services_lacator.dart';
import 'package:flutter_movies/features/movies/presentation/controller/movie_details_bloc.dart';
import 'package:flutter_movies/features/movies/presentation/controller/movies_bloc.dart';
import 'package:flutter_movies/features/movies/presentation/controller/movies_event.dart';
import 'package:flutter_movies/features/movies/presentation/screens/movie_detail_screen.dart';
import 'package:flutter_movies/features/movies/presentation/screens/movies_screen.dart';
import 'package:go_router/go_router.dart';

class RoutesGenerationConfig {
  static GoRouter goRoute = GoRouter(
    initialLocation: AppRoutes.homeScreen,
    routes: [
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => BlocProvider(
          create: (_) => sl<MoviesBloc>()
            ..add(GetNowPlayingMoviesEvent())
            ..add(GetPopularMoviesEvent())
            ..add(GetTopRatedMoviesEvent()),
          child: const MainMoviesScreen(),
        ),
      ),

      GoRoute(
        path: AppRoutes.movieDetailsScreen,
        name: AppRoutes.movieDetailsScreen,
        builder: (context, state) {
          int id = state.extra as int;
          return BlocProvider(
            create: (_) => sl<MovieDetailsBloc>()
              ..add(GetMovieDetailsEvent(id))
              ..add(GetMovieRecommendationEvent(id)),
            child: MovieDetailScreen(id: id),
          );
        },
      ),
    ],
  );
}

