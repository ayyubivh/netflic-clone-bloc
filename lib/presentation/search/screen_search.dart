import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/search/widget/search_idle.dart';
import 'package:netflix_clone/presentation/search/widget/search_result.dart';

import '../../core/debounce/constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  // final _debouncer = Debouncer(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoSearchTextField(
            onChanged: (value) {
              // if (value.isEmpty) {
              //   return;
              // }
              // _debouncer.run(() {
              //   BlocProvider.of<SearchBloc>(context)
              //       .add(SearchMovie(movieQuery: value));
              // });
            },
            backgroundColor: Colors.grey.withOpacity(0.4),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            suffixIcon: const Icon(
              CupertinoIcons.xmark_circle_fill,
              color: Colors.grey,
            ),
            style: const TextStyle(color: Colors.white),
          ),

          kHeight,
          const Expanded(
            child: SearchIdleWidget(),
          ),
          const Expanded(child: SearchResult())
          // Expanded(
          //   child: BlocBuilder<SearchBloc, SearchState>(
          //     builder: (context, state) {
          //       if (state.searchResultList.isEmpty) {
          //         return const SearchIdleWidget();
          //       } else {
          //         return const SearchResult();
          //       }
          //     },
          //   ),
          // )
        ],
      ),
    )));
  }
}
