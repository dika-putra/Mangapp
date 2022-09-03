import 'package:flutter/material.dart';
import 'package:mangapp/commons/constants.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: SizedBox(
        width: double.infinity,
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(defaultCorner),
          child: Image.network(
            'https://assets.christiantimes.com/files/cache/image/2/50/25070_w_760_281.jpg',
          ),
        ),
      ),
    );
  }
}
