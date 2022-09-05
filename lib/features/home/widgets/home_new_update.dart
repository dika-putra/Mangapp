import 'package:flutter/material.dart';
import 'package:mangapp/commons/constants.dart';
import 'package:mangapp/commons/image_widget.dart';

class HomeNewUpdate extends StatelessWidget {
  final List<Map<String, Object>> data;
  final void Function(
    BuildContext context,
    String banner,
    String title,
    String writer,
    int lastChapter,
    int lastChapterTime,
    int genreCount,
  ) onTap;
  const HomeNewUpdate({Key? key, required this.data, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: defaultPadding),
          child: Text(
            'New Update',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: Colors.black,
                ),
          ),
        ),
        const SizedBox(height: 24),
        buildList(),
      ],
    );
  }

  Widget buildList() {
    ///shuffle list
    final newData = List.from(data);
    newData.shuffle();
    return SizedBox(
      height: 300,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double tileWidth = 0;
          if (constraints.maxWidth <= 400) {
            tileWidth = MediaQuery.of(context).size.width / 2;
          } else if (constraints.maxWidth <= 600) {
            tileWidth = MediaQuery.of(context).size.width / 3;
          } else if (constraints.maxWidth <= 800) {
            tileWidth = MediaQuery.of(context).size.width / 4;
          } else if (constraints.maxWidth <= 1200) {
            tileWidth = MediaQuery.of(context).size.width / 6;
          } else {
            tileWidth = MediaQuery.of(context).size.width / 8;
          }
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final item = newData[index];
              return buildTile(
                context: context,
                tileWidth: tileWidth,
                banner: item['banner'] as String,
                title: item['title'] as String,
                writer: item['writer'] as String,
                lastChapter: item['lastChapter'] as int,
                lastChapterTime: item['lastChapterTime'] as int,
                genreCount: item['genres'] as int,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemCount: data.length,
          );
        },
      ),
    );
  }

  Widget buildTile({
    required BuildContext context,
    required double tileWidth,
    required String banner,
    required String title,
    required String writer,
    required int lastChapter,
    required int lastChapterTime,
    required int genreCount,
  }) {
    return GestureDetector(
      onTap: () => onTap(
        context,
        banner,
        title,
        writer,
        lastChapter,
        lastChapterTime,
        genreCount,
      ),
      child: SizedBox(
        width: tileWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(defaultCorner),
                child: ImageWidget(
                  banner,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: Colors.black,
                  ),
            ),
            const SizedBox(height: 4),
            RichText(
              maxLines: 1,
              text: TextSpan(
                text: 'Chap $lastChapter',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                children: [
                  TextSpan(
                    text: ' · ',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: '$lastChapterTime days ago',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
