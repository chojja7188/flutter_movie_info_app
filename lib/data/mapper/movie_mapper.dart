import 'package:flutter_movie_info_app/data/dto/movie_info_dto.dart';
import 'package:flutter_movie_info_app/data/model/movie_info.dart';

extension ToMovieInfo on ResultsDto {
  MovieInfo toMovieInfo() {
    return MovieInfo(
        adult: adult ?? false,
        backdropPath: 'https://image.tmdb.org/t/p/original$backdropPath',
        genreIds: [],
        id: id?.toInt() ?? 0,
        originalLanguage: originalLanguage ?? '',
        originalTitle: originalTitle ?? '',
        overview: overview ?? '',
        popularity: popularity ?? 0,
        posterPath: 'https://image.tmdb.org/t/p/original$posterPath',
        releaseDate: DateTime.parse(releaseDate ?? ''),
        title: title ?? '',
        video: video ?? false,
        voteAverage: voteAverage ?? 0,
        voteCount: voteCount ?? 0
    );
  }
}