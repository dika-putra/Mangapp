import 'package:flutter/material.dart';
import 'package:mangapp/commons/constants.dart';
import 'package:mangapp/features/detail/widgets/detail_chapters.dart';
import 'package:mangapp/features/detail/widgets/detail_description.dart';
import 'package:mangapp/features/detail/widgets/detail_genre.dart';
import 'package:mangapp/features/detail/widgets/detail_header.dart';

class DetailPage extends StatelessWidget {
  final String banner;
  final String title;
  final String writer;
  final int lastChapter;
  const DetailPage({
    Key? key,
    required this.banner,
    required this.title,
    required this.writer,
    required this.lastChapter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailHeader(
              banner: banner,
              lastChapter: lastChapter,
              title: title,
              writer: writer,
              onBackPressed: () => Navigator.of(context).pop(),
            ),
            const SizedBox(height: 16),
            DetailGenre(),
            const SizedBox(height: 16),
            const DetailDescription(),
            const SizedBox(height: 16),
            DetailChapters(
              lastChapter: lastChapter,
            ),
            const SizedBox(height: defaultPadding),
          ],
        ),
      ),
    );
  }
}
