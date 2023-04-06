import 'package:flutter/material.dart';
import '../../core/debounce/constants.dart';

class MainCard extends StatelessWidget {
  final String imageUrl;
  const MainCard({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 130,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kRadius,
        // image: DecorationImage(
        //   fit: BoxFit.cover,
        //   image: NetworkImage(
        //     imageUrl,
        //   ),
        // ),
      ),
      child: Image.network(
        imageUrl,
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Text('Failed to Load Image...'),
          );
        },
      ),
    );
  }
}
