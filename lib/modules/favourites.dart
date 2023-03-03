import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.favorite_outlined,
          color: Colors.red,
          size: 80,
        ),
        Text(
          'No favourites yet',
          style: TextStyle(fontSize: 30, color: Colors.red),
        ),
      ],
    );
  }
}
