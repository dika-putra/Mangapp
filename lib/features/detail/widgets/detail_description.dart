import 'package:flutter/material.dart';
import 'package:mangapp/commons/constants.dart';

class DetailDescription extends StatefulWidget {
  const DetailDescription({Key? key}) : super(key: key);

  @override
  State<DetailDescription> createState() => _DetailDescriptionState();
}

class _DetailDescriptionState extends State<DetailDescription> {
  final descriptions =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At elementum eu facilisis sed odio morbi quis. Urna neque viverra justo nec ultrices dui sapien. Id interdum velit laoreet id donec ultrices. Vitae aliquet nec ullamcorper sit amet risus nullam eget. Quis lectus nulla at volutpat diam ut venenatis tellus. Gravida rutrum quisque non tellus orci. Tempus imperdiet nulla malesuada pellentesque elit eget gravida. Aliquet risus feugiat in ante metus dictum at tempor. Leo vel fringilla est ullamcorper eget. Nibh praesent tristique magna sit amet purus gravida. In egestas erat imperdiet sed euismod nisi. Imperdiet sed euismod nisi porta lorem mollis aliquam ut porttitor. Lorem ipsum dolor sit amet consectetur adipiscing elit ut.'
      'Ultrices gravida dictum fusce ut. Mattis vulputate enim nulla aliquet porttitor. Pellentesque sit amet porttitor eget dolor morbi non. Libero justo laoreet sit amet. Augue mauris augue neque gravida in fermentum et sollicitudin. Enim nec dui nunc mattis enim ut tellus elementum sagittis. Nibh cras pulvinar mattis nunc sed blandit libero volutpat. Pharetra convallis posuere morbi leo. Tortor id aliquet lectus proin. Urna porttitor rhoncus dolor purus non. Quis commodo odio aenean sed adipiscing diam donec adipiscing tristique. Sit amet consectetur adipiscing elit.'
      'Sollicitudin tempor id eu nisl nunc. Parturient montes nascetur ridiculus mus mauris vitae ultricies. Sagittis vitae et leo duis ut diam. Massa placerat duis ultricies lacus sed. Laoreet suspendisse interdum consectetur libero id faucibus nisl tincidunt eget. Condimentum vitae sapien pellentesque habitant morbi tristique senectus. Tortor at auctor urna nunc. Proin fermentum leo vel orci porta non pulvinar. Elit pellentesque habitant morbi tristique senectus et netus et malesuada. Eget est lorem ipsum dolor sit amet. Nunc id cursus metus aliquam eleifend mi in nulla. Sit amet consectetur adipiscing elit pellentesque habitant. Platea dictumst vestibulum rhoncus est pellentesque. Et tortor consequat id porta nibh venenatis. Id cursus metus aliquam eleifend mi in nulla posuere sollicitudin. Ipsum consequat nisl vel pretium lectus quam id leo in.';
  bool showDescription = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Description',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showDescription = !showDescription;
                  });
                },
                child: Text(
                  'View all',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.orange,
                      ),
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Text(
            descriptions,
            overflow: TextOverflow.ellipsis,
            maxLines: showDescription ? 9999 : 5,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey,
                ),
          ),
        ],
      ),
    );
  }
}
