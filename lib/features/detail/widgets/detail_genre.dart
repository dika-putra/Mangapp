import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mangapp/commons/constants.dart';

class DetailGenre extends StatelessWidget {
  final genres = [
    'Action',
    'Supernaturan',
    'Fantasy',
    'Shounen',
    'Demon',
    'Psychological',
    'Comedy',
    'Drama',
    'Romance',
    'Sci-Fi',
    'Horror',
  ];

  DetailGenre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Genres',
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
              Random().nextInt(genres.length),
              (index) => buildTag(context, genres[index]),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTag(BuildContext context, String title) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(100),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.blueGrey,
            ),
      ),
    );
  }
}
