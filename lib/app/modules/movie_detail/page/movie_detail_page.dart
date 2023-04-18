// ignore_for_file: must_be_immutable, lines_longer_than_80_chars, directives_ordering

import 'package:emerson/utils/constans.dart';
import 'package:flutter/material.dart';
import 'package:emerson/app/config/flavor_config.dart';
import 'package:emerson/app/modules/movie/model/movie_response_model2.dart';

class MovieDetailPage extends StatelessWidget {
  MovieDetailPage({super.key, required this.movie});
  Results movie;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Hero(
          tag: movie.posterPath!,
          child: Material(
            child: SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.easeInOut,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(InitFlavorConfig.imageUrl + movie.posterPath!),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: ConstantsApp.primaryColor,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                        child: Column(
                          children: [
                            totalStar(movie.voteAverage!),
                            const Padding(padding: EdgeInsets.only(top: 10)),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    movie.title!,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(movie.releaseDate.toString())
                              ],
                            ),
                            const Padding(padding: EdgeInsets.only(top: 10)),
                            Text(
                              movie.overview.toString(),
                              style: const TextStyle(color: Colors.black),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.small(
          backgroundColor: Colors.red,
          onPressed: () {},
          child: const Icon(
            Icons.favorite,
          ),
        ),
      ),
    );
  }

  Widget totalStar(double total) {
    final complete = int.parse((total / 2).toString().split('.')[0]);
    final partial = int.parse((total / 2).toString().split('.')[1]) > 0 ? 1 : 0;
    final blank = 5 - (complete + partial);

    final list = <Widget>[];

    for (var i = 0; i < complete; i++) {
      list.add(
        Icon(Icons.star, color: Colors.amber[700]),
      );
    }

    for (var i = 0; i < partial; i++) {
      list.add(
        Icon(Icons.star_half, color: Colors.amber[700]),
      );
    }

    for (var i = 0; i < blank; i++) {
      list.add(
        Icon(Icons.star_border_outlined, color: Colors.amber[700]),
      );
    }

    return Row(children: list);
  }
}
