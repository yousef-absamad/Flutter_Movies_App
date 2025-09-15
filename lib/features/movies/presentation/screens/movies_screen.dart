import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/core/utils/enums.dart';
import 'package:flutter_movies/features/movies/presentation/controller/movies_bloc.dart';
import 'package:flutter_movies/features/movies/presentation/screens/see_more_screen.dart';
import 'package:flutter_movies/features/movies/presentation/widgets/now_playing_component.dart';
import 'package:flutter_movies/features/movies/presentation/widgets/popular_component.dart';
import 'package:flutter_movies/features/movies/presentation/widgets/top_rated_component.dart';
import 'package:google_fonts/google_fonts.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesBloc = context.read<MoviesBloc>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(225, 255, 255, 255),
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingComponent(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return BlocProvider.value(
                                value: moviesBloc,
                                child: SeeMoreScreen(
                                  seeMoreArgs: SeeMoreArgs(
                                    pageName: "Popular",
                                    category: MovieCategory.popular,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('See More'),
                            Icon(Icons.arrow_forward_ios, size: 16.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const PopularComponent(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Rated",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return BlocProvider.value(
                                value: moviesBloc,
                                child: SeeMoreScreen(
                                  seeMoreArgs: SeeMoreArgs(
                                    pageName: "Top Rated",
                                    category: MovieCategory.topRated,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('See More'),
                            Icon(Icons.arrow_forward_ios, size: 16.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TopRatedComponent(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
