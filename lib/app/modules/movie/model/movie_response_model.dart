// ignore_for_file: lines_longer_than_80_chars, inference_failure_on_untyped_parameter, avoid_dynamic_calls, sort_constructors_first, join_return_with_assignment, constant_identifier_names, unnecessary_lambdas

import 'dart:convert';

MovieResponseModel movieResponseModelFromJson(String str) => MovieResponseModel.fromJson(json.decode(str) as Map<String, dynamic>);

String movieResponseModelToJson(MovieResponseModel data) => json.encode(data.toJson());

class MovieResponseModel {
  MovieResponseModel({
    required this.page,
    required this.results,
    required this.totalResults,
    required this.totalPages,
  });

  int page;
  List<Result> results;
  // List<Weather> weatherList = json['weather'].map((weather) => Weather.fromJson(weather)).toList();
  int totalResults;
  int totalPages;

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) => MovieResponseModel(
        page: int.parse(json['page'].toString()),
        results: json['results'].map((x) => Result.fromJson(x as Map<String, dynamic>)) as List<Result>,
        totalResults: int.parse(json['total_results'].toString()),
        totalPages: int.parse(json['total_pages'].toString()),
      );

  Map<String, dynamic> toJson() => {
        'page': page,
        'results': List<dynamic>.from(results.map((x) => x.toJson())),
        'total_results': totalResults,
        'total_pages': totalPages,
      };
}

class Result {
  Result({
    required this.posterPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
    //required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.originalLanguage,
    required this.title,
    required this.backdropPath,
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.voteAverage,
  });
  factory Result.fromJson(Map<String, dynamic> json) => Result(
        posterPath: json['poster_path'].toString(),
        adult: json['adult'] as bool,
        overview: json['overview'].toString(),
        releaseDate: DateTime.parse(json['release_date'].toString()),
        //genreIds: List<int>.from(json['genre_ids'].map((x) => x) as List),
        id: int.parse(json['id'].toString()),
        originalTitle: json['original_title'].toString(),
        originalLanguage: originalLanguageValues.map[json['original_language']]!,
        title: json['title'].toString(),
        backdropPath: json['backdrop_path'].toString(),
        popularity: double.parse(json['popularity'].toString()),
        voteCount: int.parse(json['vote_count'].toString()),
        video: json['video'] as bool,
        voteAverage: double.parse(json['vote_average'].toString()),
      );

  String posterPath;
  bool adult;
  String overview;
  DateTime releaseDate;
  //List<int> genreIds;
  int id;
  String originalTitle;
  OriginalLanguage originalLanguage;
  String title;
  String backdropPath;
  double popularity;
  int voteCount;
  bool video;
  double voteAverage;

  Map<String, dynamic> toJson() => {
        'poster_path': posterPath,
        'adult': adult,
        'overview': overview,
        'release_date':
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        //'genre_ids': List<dynamic>.from(genreIds.map((x) => x)),
        'id': id,
        'original_title': originalTitle,
        'original_language': originalLanguageValues.reverse[originalLanguage],
        'title': title,
        'backdrop_path': backdropPath,
        'popularity': popularity,
        'vote_count': voteCount,
        'video': video,
        'vote_average': voteAverage,
      };
}

enum OriginalLanguage { EN, ES }

final originalLanguageValues = EnumValues({'en': OriginalLanguage.EN, 'es': OriginalLanguage.ES});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
