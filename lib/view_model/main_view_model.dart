import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/data/model/movie_info.dart';
import 'package:flutter_movie_info_app/data/repository/movie_repository.dart';

class MainViewModel with ChangeNotifier {
  final MovieRepository _movieRepository;

  MainViewModel(this._movieRepository);

  List<MovieInfo> _movieInfoList = [];

  List<MovieInfo> get movieInfoList => _movieInfoList;

  Future fetchMovieInfoList() async {
    _movieInfoList = await _movieRepository.getMovieInfoList();
    notifyListeners();
  }

  Future<List<MovieInfo>> getMovieInfoList() async {
    _movieInfoList = await _movieRepository.getMovieInfoList();
    return movieInfoList;
}
}