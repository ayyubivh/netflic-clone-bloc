import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/home/widgets/main_title.dart';
import 'package:netflix_clone/presentation/widgets/main_card.dart';

import '../../core/debounce/constants.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    Key? key,
    required this.title,
    required this.posterList,
  }) : super(key: key);

  final String title;
  final String posterList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kHeight,
        LimitedBox(
            maxHeight: 200,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(posterList.length,
                    (index) => MainCard(imageUrl: posterList))))
      ],
    );
  }
}
