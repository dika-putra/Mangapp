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
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <= 600) {
              return buildPhone(context);
            } else if (constraints.maxWidth <= 1000) {
              return buildTab(context, 1);
            } else if (constraints.maxWidth <= 1200) {
              return buildTab(context, 3);
            }
            return buildTab(context, 3);
          },
        ),
      ),
    );
  }

  Widget buildPhone(BuildContext context) {
    return Column(
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
    );
  }

  Widget buildTab(BuildContext context, int flex) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: DetailHeader(
                banner: banner,
                lastChapter: lastChapter,
                title: title,
                writer: writer,
                onBackPressed: () => Navigator.of(context).pop(),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              flex: flex,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  DetailGenre(),
                  const SizedBox(height: 16),
                  const DetailDescription(),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        DetailChapters(
          lastChapter: lastChapter,
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }
}
