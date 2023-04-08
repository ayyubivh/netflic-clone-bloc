import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/debounce/loader.dart';
import '../../core/debounce/constants.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInComingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Loader();
          } else if (state.hasError) {
            return const Center(
              child: Text('Error while loading coming soon list'),
            );
          } else if (state.comingSoonList.isEmpty) {
            return const Center(
              child: Text('Coming soon list is empty'),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: ListView.builder(
                itemCount: state.comingSoonList.length,
                itemBuilder: (context, index) {
                  final movie = state.comingSoonList[index];
                  if (movie.id == null) {
                    return const SizedBox();
                  }
                  final date = DateTime.parse(movie.releaseDate!);
                  final formatedMonth = DateFormat('MMM').format(date);
                  final formatedDay = DateFormat('dd').format(date);

                  return ComingSoonWidget(
                      id: movie.id.toString(),
                      month: formatedMonth.toUpperCase(),
                      day: formatedDay,
                      posterPath: '$imageAppendUrl${movie.posterPath}',
                      movieName: movie.originalTitle ?? 'No Title',
                      description: movie.overview ?? 'No Description');
                },
              ),
            );
          }
        },
      ),
    );
  }
}

class EveryoneIsWatchingList extends StatelessWidget {
  const EveryoneIsWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryoneIsWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInComingSoon());
      },
      child:
          BlocBuilder<HotAndNewBloc, HotAndNewState>(builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.hasError) {
          return const Center(
            child: Text("Error while loading the coming soon list"),
          );
        } else if (state.everyOneIsWatchingList.isEmpty) {
          return const Center(
            child: Text("Coming soon list is empty"),
          );
        } else {
          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) {
              final movie = state.everyOneIsWatchingList[index];
              if (movie.id == null) {
                return const SizedBox();
              }
              final tv = state.everyOneIsWatchingList[index];

              return EveryoneWatchingWidget(
                movieName: tv.originalName ?? "No name provider",
                description: tv.overview ?? "No description",
                posterPath: '$imageAppendUrl${tv.posterPath}',
              );
            },
            itemCount: 10,
          );
        }
      }),
    );
  }
  //       },
  //     ),
  //   );
  // }
}
