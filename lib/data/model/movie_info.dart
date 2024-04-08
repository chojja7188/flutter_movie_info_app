import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_info.freezed.dart';

@freezed
class MovieInfo with _$MovieInfo {
  const factory MovieInfo({
    @Default(false)
    bool adult,
    required String backdropPath,
    required List<num> genreIds,
    required int id,
    required String originalLanguage,
    required String originalTitle,
    required String overview,
    required num popularity,
    required String posterPath,
    required DateTime releaseDate,
    required String title,
    required bool video,
    required num voteAverage,
    required num voteCount
  }) = _MovieInfo;
}