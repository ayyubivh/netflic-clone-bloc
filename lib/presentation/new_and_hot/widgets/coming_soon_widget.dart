import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import '../../../core/debounce/constants.dart';
import '../../home/widgets/custom_btn.dart';
import 'video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  // final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget(
      {super.key,
      // required this.id,
      required this.month,
      required this.day,
      required this.posterPath,
      required this.movieName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style: const TextStyle(
                  fontSize: 19,
                  color: kGrey,
                ),
              ),
              Text(
                day,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    letterSpacing: 4),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                url: posterPath,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        // letterSpacing: -3,
                      ),
                    ),
                  ),
                  Row(
                    children: const [
                      CustomBtnWidget(
                          title: 'Remind Me',
                          textSize: 14,
                          iconSize: 20,
                          icon: Icons.notifications_outlined),
                      kWidth,
                      CustomBtnWidget(
                          title: 'Help',
                          textSize: 14,
                          iconSize: 20,
                          icon: Icons.info_outline),
                      kWidth
                    ],
                  )
                ],
              ),
              kHeight,
              Text('Coming on $day $month'),
              kHeight,
              Text(
                movieName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight,
              Text(
                description,
                maxLines: 7,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: kGrey,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
