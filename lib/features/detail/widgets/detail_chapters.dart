import 'dart:math';

import 'package:flutter/material.dart';

import '../../../commons/constants.dart';

class DetailChapters extends StatefulWidget {
  final int lastChapter;
  const DetailChapters({Key? key, required this.lastChapter}) : super(key: key);

  @override
  State<DetailChapters> createState() => _DetailChaptersState();
}

class _DetailChaptersState extends State<DetailChapters> {
  final dropdownItems = ['Lastest', 'Oldest'];
  int selectedItem = 0;
  var chapterItems = [];

  @override
  void initState() {
    super.initState();
    chapterItems =
        List.generate(widget.lastChapter, (index) => Random().nextBool());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Chapter',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              buildDropdown(context),
            ],
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth <= 600) {
                return buildList(context);
              } else if (constraints.maxWidth <= 1000) {
                return buildGrid(context, 6);
              } else if (constraints.maxWidth <= 1200) {
                return buildGrid(context, 8);
              }
              return buildGrid(context, 10);
            },
          ),
        ],
      ),
    );
  }

  Widget buildDropdown(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButton(
        isDense: true,
        dropdownColor: Colors.orange,
        underline: const SizedBox.shrink(),
        icon: const Icon(
          Icons.arrow_drop_down_rounded,
          color: Colors.white,
        ),
        items: List.generate(
          dropdownItems.length,
          (index) => DropdownMenuItem(
            value: index,
            child: Text(
              dropdownItems[index],
            ),
          ),
        ),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
            ),
        value: selectedItem,
        onChanged: (value) {
          setState(() {
            selectedItem = value ?? 0;
          });
        },
      ),
    );
  }

  Widget buildList(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.withAlpha(150),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        itemCount: chapterItems.length,
        reverse: selectedItem == 0,
        itemBuilder: (context, index) {
          final isRead = chapterItems[index];
          return Row(
            children: [
              Expanded(
                child: Text(
                  'Chapter ${index + 1}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isRead ? Colors.blueGrey : Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Text(
                '${index + 7} days ago',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.blueGrey,
                    ),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 16),
      ),
    );
  }

  Widget buildGrid(BuildContext context, int gridCount) {
    return GridView.count(
      crossAxisCount: gridCount,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      reverse: selectedItem == 0,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        chapterItems.length,
        (index) {
          final isRead = chapterItems[index];
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isRead ? Colors.grey.withAlpha(150) : Colors.orange,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Chapter',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: isRead ? Colors.blueGrey : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${index + 1}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: isRead ? Colors.blueGrey : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${index + 7} days ago',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: isRead ? Colors.blueGrey : Colors.white,
                        ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
