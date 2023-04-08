import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/debounce/constants.dart';
import '../../application/home/home_bloc.dart';
import '../widgets/main_title_card.dart';
import 'widgets/bg_card.dart';
import 'widgets/number_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (BuildContext context, dynamic value, Widget? child) {
        return NotificationListener<UserScrollNotification>(
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
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    );
                  } else if (state.hasError) {
                    return const Center(
                      child: Text(
                        'Oops..!!\n Error while getting data.!',
                        style: TextStyle(color: kWhite),
                      ),
                    );
                  }
                  //released Past year-------------
                  final releasedPastYear = state.pastYearMovieList.map(
                    (m) {
                      return '$imageAppendUrl${m.posterPath}';
                    },
                  ).toList();
                  //trending--------

                  final trending = state.trendingMovieList.map(
                    (m) {
                      return '$imageAppendUrl${m.posterPath}';
                    },
                  ).toList();
                  //tense drama---------
                  final tenseDrama = state.tenseDramaMovieList.map(
                    (m) {
                      return '$imageAppendUrl${m.posterPath}';
                    },
                  ).toList();
                  //south indian Cinemas---------

                  final southIndianCinemas = state.southIndianMovieList.map(
                    (m) {
                      return '$imageAppendUrl${m.posterPath}';
                    },
                  ).toList();
                  southIndianCinemas.shuffle();

                  // top 10 tv show--------

                  final top10TvShow = state.trendingTvList.map(
                    (m) {
                      return '$imageAppendUrl${m.posterPath}';
                    },
                  ).toList();
                  top10TvShow.shuffle();
                  final firstImg = state.trendingTvList.map(
                    (m) {
                      return '$imageAppendUrl${m.posterPath}';
                    },
                  ).toList();
                  //listview--------------

                  return ListView(
                    children: [
                      BgCard(
                        img: firstImg[10],
                      ),
                      kHeight,
                      MainTitleCard(
                        title: 'Released in the Past Year',
                        posterList: releasedPastYear,
                      ),
                      kHeight,
                      MainTitleCard(
                          title: 'Trending Now', posterList: trending),
                      kHeight,
                      NumberTitleCard(
                        posterList: top10TvShow.sublist(0, 10),
                      ),
                      MainTitleCard(
                          title: 'Tense Dramas', posterList: tenseDrama),
                      kHeight,
                      MainTitleCard(
                          title: 'South Indian Cinemas',
                          posterList: southIndianCinemas),
                      kHeight,
                    ],
                  );
                },
              ),
              scrollNotifier.value == true
                  ? AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      width: double.infinity,
                      height: 80,
                      color: Colors.black.withOpacity(0.3),
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
                              kWidth,
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
                  : kHeight
            ],
          ),
        );
      },
    ));
  }
}
