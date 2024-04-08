import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/presentation/component/movie_item.dart';
import 'package:flutter_movie_info_app/view_model/main_view_model.dart';

class MainScreen extends StatefulWidget {
  final MainViewModel viewModel;

  const MainScreen({super.key, required this.viewModel});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void updateUi() => setState(() {});

  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(updateUi);
  }

  @override
  void dispose() {
    widget.viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = widget.viewModel;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: const Row(
          children: [
            Text('Movie Info App', style: TextStyle(color: Colors.white),),
            SizedBox(width: 8,),
            Icon(Icons.movie_creation_outlined, color: Colors.white,)
          ],
        )
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                updateUi();
              },
              child: const Text('Fetch')
          ),
          SizedBox(
            height: 500,
            child: FutureBuilder<void>(
              future: viewModel.fetchMovieInfoList(),
              builder: (context, snapshot) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 1/2,
                  ),
                  itemCount: viewModel.movieInfoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const CircularProgressIndicator();
                      case ConnectionState.done:
                        return MovieItem(
                          imagePath: viewModel.movieInfoList[index].posterPath,
                          title: viewModel.movieInfoList[index].title,
                        );
                      case ConnectionState.none:
                      case ConnectionState.active:
                    }
                  },
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
