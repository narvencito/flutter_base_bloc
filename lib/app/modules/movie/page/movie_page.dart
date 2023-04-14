// ignore_for_file: prefer_final_locals, omit_local_variable_types, lines_longer_than_80_chars, inference_failure_on_instance_creation, inference_failure_on_function_return_type, always_declare_return_types

import 'dart:ui' as ui;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/app/config/flavor_config.dart';
import 'package:movie/app/modules/movie/bloc/movie_bloc.dart';
import 'package:movie/app/modules/movie/model/movie_response_model2.dart';
import 'package:movie/app/modules/movie/widgets/dot_indicator.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  static Widget create(BuildContext context) {
    return BlocProvider<MovieBloc>(
      create: (_) => MovieBloc()..loadMovies(),
      child: const MoviePage(),
    );
  }

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> with SingleTickerProviderStateMixin {
  late TabController tabController;
  late final PageController _movieCardPageController;
  late final PageController _movieDetailPageController;

  double _movieCardPage = 0;
  double _movieDetailsPage = 0;
  int _movieCardIndex = 0;
  final _showMovieDetails = ValueNotifier(true);

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    _movieCardPageController = PageController(viewportFraction: 0.77)..addListener(_movieCardPagePercentListener);
    _movieDetailPageController = PageController()..addListener(_movieDetailsPagePercentListener);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    _movieCardPageController
      ..removeListener(_movieCardPagePercentListener)
      ..dispose();
    _movieDetailPageController
      ..removeListener(_movieDetailsPagePercentListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          bottom: TabBar(
            controller: tabController,
            isScrollable: true,
            indicator: const DotIndicator(),
            tabs: const [
              Tab(text: 'Movie'),
              Tab(text: 'Series'),
              Tab(text: 'TV Show'),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                if (state is MovieLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is MovieLoadCompleteState) {
                  return SizedBox(
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                        },
                      ),
                      child: Column(
                        children: [
                          const Spacer(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: PageView.builder(
                              controller: _movieCardPageController,
                              itemCount: state.response.results!.length,
                              onPageChanged: (page) {
                                _movieDetailPageController.animateToPage(
                                  page,
                                  duration: const Duration(milliseconds: 500),
                                  curve: const Interval(0.25, 1, curve: Curves.decelerate),
                                );
                              },
                              itemBuilder: (context, index) {
                                Results movie = state.response.results![index];
                                final progress = _movieCardPage - index;
                                final scale = ui.lerpDouble(1, .8, progress.abs())!;
                                final isCurrentPage = index == _movieCardIndex;
                                final isScrolling = _movieCardPageController.position.isScrollingNotifier.value;
                                final isFirstPage = index == 0;
                                return Transform.scale(
                                  alignment: Alignment.lerp(
                                    Alignment.topLeft,
                                    Alignment.center,
                                    -progress,
                                  ),
                                  scale: (isScrolling && isFirstPage) ? 1.0 - progress : scale,
                                  child: GestureDetector(
                                    onTap: () {
                                      _showMovieDetails.value = !_showMovieDetails.value;
                                      const transitionDuration = Duration(milliseconds: 550);
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          transitionDuration: transitionDuration,
                                          reverseTransitionDuration: transitionDuration,
                                          pageBuilder: (_, animation, ___) {
                                            return FadeTransition(opacity: animation, child: const Text('data'));
                                          },
                                        ),
                                      );
                                      Future.delayed(transitionDuration, () {
                                        _showMovieDetails.value = !_showMovieDetails.value;
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 50),
                                      child: Hero(
                                        tag: movie.posterPath!,
                                        child: AnimatedContainer(
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.easeInOut,
                                          transform: Matrix4.identity()
                                            ..translate(
                                              isCurrentPage ? 0.0 : -20.0,
                                              isCurrentPage ? 0.0 : 60.0,
                                            ),
                                          decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(
                                              Radius.circular(70),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 25,
                                                offset: const Offset(0, 25),
                                                color: Colors.black.withOpacity(.2),
                                              ),
                                            ],
                                            image: DecorationImage(
                                              image: NetworkImage(InitFlavorConfig.imageUrl + movie.posterPath!),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          //const Spacer(),
                          //movie detail
                          Container(
                            height: MediaQuery.of(context).size.height * 0.10,
                            margin: const EdgeInsets.only(top: 10),
                            color: Colors.transparent,
                            child: PageView.builder(
                              controller: _movieDetailPageController,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.response.results!.length,
                              itemBuilder: (_, index) {
                                Results movie = state.response.results![index];
                                final opacity = (index - _movieDetailsPage).clamp(0.0, 1.0);

                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .1),
                                  child: Opacity(
                                    opacity: 1 - opacity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Hero(
                                          tag: movie.title!,
                                          child: Material(
                                            type: MaterialType.transparency,
                                            child: Text(
                                              movie.title!.toUpperCase(),
                                              //style: AppTextStyles.movieNameTextStyle,
                                            ),
                                          ),
                                        ),
                                        ValueListenableBuilder<bool>(
                                          valueListenable: _showMovieDetails,
                                          builder: (_, value, __) {
                                            return Visibility(
                                              visible: value,
                                              child: Text(
                                                movie.originalTitle!,
                                                //style: AppTextStyles.movieDetails,
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }

                if (state is MovieErrorState) {
                  return const Center(child: Text('error'));
                }

                return Container();
              },
            ),
            const Text('data 2'),
            const Text('data 3')
          ],
        ),
      ),
    );
  }

  _movieCardPagePercentListener() {
    setState(() {
      _movieCardPage = _movieCardPageController.page!;
      _movieCardIndex = _movieCardPageController.page!.round();
    });
  }

  _movieDetailsPagePercentListener() {
    setState(() {
      _movieDetailsPage = _movieDetailPageController.page!;
    });
  }
}
