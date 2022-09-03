import 'package:flutter/material.dart';
import 'package:mangapp/commons/constants.dart';

class DetailDescription extends StatefulWidget {
  const DetailDescription({Key? key}) : super(key: key);

  @override
  State<DetailDescription> createState() => _DetailDescriptionState();
}

class _DetailDescriptionState extends State<DetailDescription> {
  final descriptions =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Curabitur vitae nunc sed velit. Amet mauris commodo quis imperdiet massa tincidunt. Turpis massa sed elementum tempus egestas sed sed. Arcu odio ut sem nulla pharetra diam sit amet. Duis tristique sollicitudin nibh sit amet commodo nulla facilisi. Urna porttitor rhoncus dolor purus non enim praesent. Non blandit massa enim nec dui nunc mattis enim. Sit amet consectetur adipiscing elit duis tristique sollicitudin nibh sit. Tortor dignissim convallis aenean et tortor at risus. Nibh nisl condimentum id venenatis a condimentum vitae sapien. Sit amet mattis vulputate enim nulla aliquet. Velit ut tortor pretium viverra suspendisse. In hac habitasse platea dictumst vestibulum rhoncus est pellentesque. Vel risus commodo viverra maecenas accumsan lacus vel facilisis.';
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
