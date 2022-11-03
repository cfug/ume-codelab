import 'package:flutter/material.dart';

import 'model.dart';

class ListCard extends StatelessWidget {
  const ListCard({super.key, this.movieItems});
  final MovieItems? movieItems;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            movieItems?.data.first.poster ?? '',
            cacheWidth: 100,
            width: 100,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movieItems?.data.first.name ?? ''),
                Text(movieItems?.data.first.genre ?? ''),
                Text(movieItems?.data.first.country ?? ''),
                Text(
                  movieItems?.data.first.description ?? '',
                  maxLines: 2,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/douban.png',
                      width: 24,
                    ),
                    Text(movieItems?.doubanRating ?? ''),
                    const SizedBox(
                      width: 12,
                    ),
                    Image.asset(
                      'assets/images/imdb.png',
                      width: 24,
                    ),
                    Text(movieItems?.imdbRating ?? ''),
                    const SizedBox(
                      width: 12,
                    ),
                    Image.asset(
                      'assets/images/rotten_tomatoes.png',
                      width: 24,
                    ),
                    Text(movieItems?.rottenRating ?? ''),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
