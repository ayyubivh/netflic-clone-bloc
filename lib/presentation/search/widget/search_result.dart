import 'package:flutter/cupertino.dart';
import '../../../core/debounce/constants.dart';
import '../../widgets/main_card.dart';
import 'title.dart';

final imageurl =
    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/tm1kAqfiElwOgXLI8goHBqhIWIM.jpg';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTItle(title: "Movies & TV"),
        kHeight,
        Expanded(
          child:
              //BlocBuilder<SearchBloc, SearchState>(
              //     builder: (context, state) {
              // return
              GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1 / 1.4,
            shrinkWrap: true,
            children: List.generate(20, (index) {
              // final movie = state.searchResultList[index];
              return MainCard(imageUrl: imageurl);
            }),
            // );
            // },
          ),
        )
      ],
    );
  }
}
