import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/home/widgets/bg_card.dart';
import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_clone/presentation/search/widget/search_result.dart';
import '../../core/debounce/constants.dart';
import '../../core/debounce/string.dart';
import '../widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(false);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: const [
                    BgCard(),
                    MainTitleCard(
                      title: 'Release in the past year',
                      posterList: tempImg,
                    ),
                    kHeight,
                    MainTitleCard(
                      title: 'Trending now',
                      posterList: tempImg,
                    ),
                    kHeight,
                    NumberTitleCard(posterList: tempImg),
                    kHeight,
                    MainTitleCard(
                      title: 'Tense Dramas',
                      posterList: tempImg,
                    ),
                    MainTitleCard(
                      title: 'South Indian Cinema',
                      posterList: tempImg,
                    ),
                  ],
                ),
                scrollNotifier.value
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        height: 80,
                        color: kBlack.withOpacity(0.3),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  'https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png',
                                  width: 60,
                                  height: 60,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                kWidth,
                                Container(
                                  height: 30,
                                  width: 30,
                                  color: Colors.blue,
                                ),
                                kWidth
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('TV Shows', style: kHomeTileText),
                                Text('Movies', style: kHomeTileText),
                                Text('Categories', style: kHomeTileText),
                              ],
                            )
                          ],
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        );
      },
    ));
  }
}
