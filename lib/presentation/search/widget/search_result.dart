import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import '../../../core/debounce/constants.dart';
import '../../widgets/main_card.dart';
import 'title.dart';

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
              BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
            return GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1 / 1.4,
              shrinkWrap: true,
              children: List.generate(20, (index) {
                final movie = state.searchResultData[index];
                return MainCard(imageUrl: movie.posterImageUrl);
              }),
            );
          }),
        )
      ],
    );
  }
}
