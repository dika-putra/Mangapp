import 'package:flutter/material.dart';
import 'package:mangapp/features/detail/detail_page.dart';
import 'package:mangapp/features/home/widgets/home_app_bar.dart';
import 'package:mangapp/features/home/widgets/home_banner.dart';
import 'package:mangapp/features/home/widgets/home_new_update.dart';
import 'package:mangapp/features/home/widgets/home_top_popular.dart';

import '../../commons/dummies.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
