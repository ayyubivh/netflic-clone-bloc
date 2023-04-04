import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/constants.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/video_widget.dart';

import '../../home/widgets/custom_btn.dart';

class EveryoneWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;
  const EveryoneWatchingWidget({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          movieName,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        Text(
          description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: kGrey),
        ),
        kHeight50,
        VideoWidget(url: posterPath),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomBtnWidget(title: 'Share', icon: Icons.send_outlined),
            kWidth,
            CustomBtnWidget(title: 'Add', icon: Icons.add),
            kWidth,
            CustomBtnWidget(title: 'Play', icon: Icons.play_arrow),
            kWidth,
          ],
        )
      ],
    );
  }
}
