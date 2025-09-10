import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/core/routing/app_routes.dart';
import 'package:flutter_movies/core/utils/enums.dart';
import 'package:flutter_movies/features/movies/presentation/controller/movies_bloc.dart';
import 'package:flutter_movies/features/movies/presentation/controller/movies_state.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/network/api_constance.dart';

class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.topRatedState != current.topRatedState,
      builder: (context, state) {
        switch (state.topRatedState) {
          case RequestState.loading:
            return const SizedBox(
              height: 170,
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.topRatedMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.topRatedMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          GoRouter.of(context).pushNamed(
                            AppRoutes.movieDetailsScreen,
                            extra: movie.id,
                          );
                        },
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: ApiConstance.imageUrl(movie.imageUrl),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestState.error:
            return SizedBox(height: 400, child: Text(state.nowPlayingMessage));
        }
      },
    );
  }
}
