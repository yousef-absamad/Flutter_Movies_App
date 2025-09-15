import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/core/utils/enums.dart';
import 'package:flutter_movies/features/movies/presentation/controller/movies_bloc.dart';
import 'package:flutter_movies/features/movies/presentation/controller/movies_state.dart';
import 'package:flutter_movies/features/movies/presentation/widgets/movie_card.dart';

class SeeMoreScreen extends StatefulWidget {
  final SeeMoreArgs seeMoreArgs;
  const SeeMoreScreen({super.key, required this.seeMoreArgs});

  @override
  State<SeeMoreScreen> createState() => _SeeMoreScreenState();
}

class _SeeMoreScreenState extends State<SeeMoreScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final bloc = context.read<MoviesBloc>();
    final max = _scrollController.position.maxScrollExtent;
    final pos = _scrollController.position.pixels;

    if (pos >= max - 200) {
      bloc.fetchSeeMoreMovies(widget.seeMoreArgs.category);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.seeMoreArgs.pageName} Movies',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          final movies = widget.seeMoreArgs.category == MovieCategory.popular
              ? state.popularMovies
              : state.topRatedMovies;
          return GridView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
            ),
            itemCount: movies.length + (state.hasReachedMax ? 0 : 2),
            itemBuilder: (context, index) {
              if (index < movies.length) {
                return MovieCard(movie: movies[index]);
              } else {
                return const Center(
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}


class SeeMoreArgs {
  final String pageName;
  final MovieCategory category;
  SeeMoreArgs({required this.pageName, required this.category});
}
