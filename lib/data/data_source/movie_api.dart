import 'dart:convert';

import 'package:flutter_movie_info_app/data/dto/movie_info_dto.dart';
import 'package:flutter_movie_info_app/data/model/movie.dart';
import 'package:flutter_movie_info_app/data/model/movie_info.dart';
import 'package:http/http.dart' as http;

class MovieApi {
  final _baseUrl = 'https://api.themoviedb.org/3/movie';
  final _apiKey = 'a64533e7ece6c72731da47c9c8bc691f';
  final http.Client _client;

  MovieApi({http.Client? client}) : _client = client ?? http.Client();

  Future<List<ResultsDto>> getMovieInfoList() async {
    final response = await _client.get(Uri.parse('$_baseUrl/upcoming?api_key=$_apiKey&language=ko-KR&page=1'))
        .onError((error, stackTrace) => throw Exception('Error: $error'));

    final json = response.statusCode == 200
        ? jsonDecode(utf8.decode(response.bodyBytes))
        : throw Exception('Error: statusCode:${response.statusCode}');

    final jsonList = json['results'] as List;

    return jsonList.map((e) => ResultsDto.fromJson(e)).toList();
  }

  /*
  Future<Movie> getMovie(int id) async {
    final response = await _client.get(Uri.parse('$_baseUrl/$id?api_key=$_apiKey&language=ko-KR&page=1'))
        .onError((error, stackTrace) => throw Exception('Error: $error'));

    final json = response.statusCode == 200
        ? jsonDecode(utf8.decode(response.bodyBytes))
        : throw Exception('Error: statusCode:${response.statusCode}');

    return Movie.fromJson(json);
  }
   */
}