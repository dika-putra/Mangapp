import 'package:flutter/material.dart';

import '../../../commons/constants.dart';

class DetailHeader extends StatefulWidget {
  final String banner;
  final String title;
  final String writer;
  final int lastChapter;
  final VoidCallback onBackPressed;

  const DetailHeader({
    Key? key,
    required this.title,
    required this.banner,
    required this.writer,
    required this.lastChapter,
    required this.onBackPressed,
  }) : super(key: key);

  @override
  State<DetailHeader> createState() => _DetailHeaderState();
}

class _DetailHeaderState extends State<DetailHeader> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(defaultCorner),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 250,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    widget.banner,
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: GestureDetector(
                      onTap: () {
                        widget.onBackPressed.call();
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: const Icon(
                          Icons.chevron_left_rounded,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${widget.writer} | Chapter ${widget.lastChapter}',
                        maxLines: 1,
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              color: Colors.blueGrey,
                            ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavourite = !isFavourite;
                    });
                  },
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        Icons.favorite,
                        color: isFavourite ? Colors.red : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
