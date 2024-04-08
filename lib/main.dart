import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/data/repository/movie_repository.dart';
import 'package:flutter_movie_info_app/presentation/main/main_screen.dart';
import 'package:flutter_movie_info_app/view_model/main_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: MainScreen(viewModel: MainViewModel(MovieRepositoryImpl()))
    );
  }
}