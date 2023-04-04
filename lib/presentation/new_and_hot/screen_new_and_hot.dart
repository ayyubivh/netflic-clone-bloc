import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/search/widget/search_result.dart';

import '../../core/colors/constants.dart';
import 'widgets/coming_soon_widget.dart';
import 'widgets/every_one_watch.dart';

class NewAndHotScreen extends StatelessWidget {
  const NewAndHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              "New & Hot",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            actions: [
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
            ],
            bottom: TabBar(
                unselectedLabelColor: kWhite,
                labelColor: kBlack,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                isScrollable: true,
                indicator: BoxDecoration(
                  color: kWhite,
                  borderRadius: kRadius30,
                ),
                tabs: const [
                  Tab(text: "🍿 Coming Soon "),
                  Tab(text: "👀  Everyone's watching "),
                ]),
          ),
        ),
        body: const TabBarView(
          children: [
            ComingSoonList(),
            EveryoneIsWatchingList(),
          ],
        ),
      ),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 20),
      itemCount: 10,
      itemBuilder: ((context, index) {
        // final movie = state.comingSoonList[index];

        // if (movie.id == null) {
        //   return const SizedBox();
        // }
        // final _date = DateTime.parse(DateTime.now());
        final formatedMonth = DateFormat('MMM').format(DateTime.now());
        final formatedDay = DateFormat('dd').format(DateTime.now());
        return ComingSoonWidget(
            // id: DateTime.now(),
            month: formatedMonth,
            day: formatedDay,
            posterPath: imageurl,
            movieName: 'No title',
            description: "No description");
      }),
    );
  }
}

class EveryoneIsWatchingList extends StatelessWidget {
  const EveryoneIsWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   BlocProvider.of<HotAndNewBloc>(context)
    //       .add(const LoadDataInEveryoneIsWatching());
    // });
    // return
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        // final movie = state.everyOneIsWatchingList[index];
        // if (movie.id == null) {
        //   return const SizedBox();
        // }

        // final tv = state.everyOneIsWatchingList[index];

        return EveryoneWatchingWidget(
          movieName: "No name provider",
          description: "No description",
          posterPath: imageurl,
        );
      },
      itemCount: 10,
    );
  }
  //       },
  //     ),
  //   );
  // }
}
