import 'package:flutter/material.dart';
import 'package:mangapp/commons/constants.dart';

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
        SizedBox(
          height: tileHeight,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final item = data[index];
              return buildTile(
                context: context,
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
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget buildTile({
    required BuildContext context,
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
        width: (MediaQuery.of(context).size.width / 2) + 32,
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(defaultCorner),
                  child: Image.network(
                    banner,
                    width: 80,
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
