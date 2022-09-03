import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mangapp/features/detail/detail_page.dart';
import 'package:mangapp/features/home/widgets/home_app_bar.dart';
import 'package:mangapp/features/home/widgets/home_banner.dart';
import 'package:mangapp/features/home/widgets/home_new_update.dart';
import 'package:mangapp/features/home/widgets/home_top_popular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final data = [
    {
      'title': 'One Punch Man',
      'writer': 'One',
      'lastChapter': 12,
      'lastChapterTime': Random().nextInt(60) + 1,
      'genres': Random().nextInt(3) + 1,
      'banner':
          'https://cdn.animeuknews.net/app/uploads/2017/07/One-Punch-Man-cover.jpg'
    },
    {
      'title': 'Overlord',
      'writer': 'Kugane Maruyama',
      'lastChapter': 70,
      'lastChapterTime': Random().nextInt(60) + 1,
      'genres': Random().nextInt(3) + 1,
      'banner':
          'https://freshcomics.s3.amazonaws.com/issue_covers/APR162152.jpg',
    },
    {
      'title': 'Sword Art Online',
      'writer': 'Reki Kawahara',
      'lastChapter': 26,
      'lastChapterTime': Random().nextInt(60) + 1,
      'genres': Random().nextInt(3) + 1,
      'banner':
          'https://i0.wp.com/operationrainfall.com/wp-content/uploads/2016/08/Sword_Art_Online_Volume_18_LN_Cover.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: HomeAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeBanner(),
            HomeNewUpdate(
              data: data,
              onTap: navigateToDetail,
            ),
            HomeTopPopular(
              data: data,
              onTap: navigateToDetail,
            ),
          ],
        ),
      ),
    );
  }

  void navigateToDetail(
    BuildContext context,
    String banner,
    String title,
    String writer,
    int lastChapter,
    int lastChapterTime,
    int genreCount,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(
          title: title,
          banner: banner,
          writer: writer,
          lastChapter: lastChapter,
        ),
      ),
    );
  }
}
