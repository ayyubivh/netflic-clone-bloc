import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/search/widget/title.dart';

import '../../../core/debounce/constants.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);
  final imageurl =
      'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/tm1kAqfiElwOgXLI8goHBqhIWIM.jpg';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        const SearchTextTItle(
          title: 'Top Searches',
        ),
        kHeight,
        Expanded(
            child:
                //   child: BlocBuilder<SearchBloc, SearchState>(
                //     builder: (context, state) {
                //       if (state.isLoading) {
                //         return const Center(
                //           child: CircularProgressIndicator(),
                //         );
                //       } else if (state.isError) {
                //         return const Center(
                //           child: Text('Oops..!!\nError While Loading..!!'),
                //         );
                //       } else if (state.idleList.isEmpty) {
                //         return const Center(
                //           child: Text('Oops..!!\n List is Empty...'),
                //         );
                //       }
                // return
                ListView.separated(
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            // final movie = state.idleList[index];
            return TopSearchList(
              imageUrls: imageurl,
              title: 'Not Provided',
            );
          }),
          separatorBuilder: ((context, index) => kHeight20),
        )
            // },
            // ),
            )
      ],
    );
  }
}

class TopSearchList extends StatelessWidget {
  final String title;
  final String imageUrls;
  const TopSearchList({Key? key, required this.title, required this.imageUrls})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.38,
          height: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrls),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
          title,
          style: const TextStyle(
            color: kWhite,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        )),
        const Icon(
          Icons.play_circle_outlined,
          size: 50,
          color: Colors.white,
        ),
      ],
    );
  }
}
