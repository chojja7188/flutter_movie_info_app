import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  final String imagePath;
  final String title;

  const MovieItem({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Image.network(imagePath, loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if  (loadingProgress == null) {
              return child;
            }
            return CircularProgressIndicator();
          }),
          Text(title)
        ],
      ),
    );
  }
}
