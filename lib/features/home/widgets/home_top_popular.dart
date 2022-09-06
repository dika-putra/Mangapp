import 'package:flutter/material.dart';
import 'package:mangapp/commons/constants.dart';
import 'package:mangapp/commons/image_widget.dart';

import '../../../commons/dummies.dart';

class HomeTopPopular extends StatelessWidget {
  final List<Map<String, Object>> data;
  final double tileHeight = 150;
  final void Function(
    BuildContext context,
    String banner,
    String title,
    String writer,
    int lastChapter,
    int lastChapterTime,
    int genreCount,
  ) onTap;
  const HomeTopPopular({Key? key, required this.data, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: defaultPadding,
            top: defaultPadding,
          ),
          child: Text(
            'Top Popular',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: Colors.black,
                ),
          ),
        ),
        const SizedBox(height: 24),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <= 600) {
              return buildList(context, 250);
            } else if (constraints.maxWidth <= 1000) {
              return buildList(context, 300);
            } else if (constraints.maxWidth <= 1200) {
              return buildGrid(context, 3, 2.6 / 1);
            }
            return buildGrid(context, 5, 1.8 / 1);
          },
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget buildGrid(BuildContext context, int gridCount, double tileRatio) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      crossAxisCount: gridCount,
      childAspectRatio: tileRatio,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      children: List.generate(
        data.length,
        (index) {
          final item = data[index];
          return buildTile(
            context: context,
            width: double.infinity,
            banner: item['banner'] as String,
            title: item['title'] as String,
            writer: item['writer'] as String,
            lastChapter: item['lastChapter'] as int,
            lastChapterTime: item['lastChapterTime'] as int,
            genreCount: item['genres'] as int,
          );
        },
      ),
    );
  }

  Widget buildList(BuildContext context, double tileWidth) {
    return SizedBox(
      height: tileHeight,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = data[index];
          return buildTile(
            context: context,
            width: tileWidth,
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
      ),
    );
  }

  Widget buildTile({
    required BuildContext context,
    required double width,
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
        width: width,
        height: tileHeight,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultCorner),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 80,
                  height: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(defaultCorner),
                    child: ImageWidget(
                      banner,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              color: Colors.black,
                            ),
                      ),
                      RichText(
                        maxLines: 1,
                        text: TextSpan(
                          text: 'Chap $lastChapter',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
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
                      Wrap(
                        spacing: 4,
                        children: List.generate(
                          genreCount,
                          (index) => Text(
                            '#${genres[index]}',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
