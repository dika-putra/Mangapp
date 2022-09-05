import 'package:flutter/material.dart';
import 'package:mangapp/commons/constants.dart';
import 'package:mangapp/commons/image_widget.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.width / 4.5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(defaultCorner),
          child: const ImageWidget(
            'https://assets.christiantimes.com/files/cache/image/2/50/25070_w_760_281.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
