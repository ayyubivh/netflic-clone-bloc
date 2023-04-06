import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/downloads/i_download_repo.dart';
import 'package:netflix_clone/domain/search/search_service.dart';

import '../../domain/downloads/models/downloads.dart';
import '../../domain/search/models/search_response.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsRepo;
  final SearchRepo _searchRepo;
  SearchBloc(this._downloadsRepo, this._searchRepo)
      : super(SearchState.initial()) {
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(state);
        return;
      }
      emit(
        const SearchState(
          searchResultData: [],
          idleList: [],
          isLoading: true,
          isError: false,
        ),
      );
      final _result = await _downloadsRepo.getDownloadsImages();
      _result.fold((MainFailure l) {
        emit(
          const SearchState(
            searchResultData: [],
            idleList: [],
            isLoading: false,
            isError: true,
          ),
        );
      }, (List<Downloads> list) {
        emit(
          SearchState(
            searchResultData: [],
            idleList: list,
            isLoading: false,
            isError: false,
          ),
        );
      });
    });
    on<SearchMovie>((event, emit) async {
      log('serching for ${event.movieQuerry}');
      // print(_result.toString());
      final _result =
          await _searchRepo.searchMovies(movieQuerry: event.movieQuerry);
      final _state = _result.fold(
        (MainFailure l) {
          return const SearchState(
            searchResultData: [],
            idleList: [],
            isLoading: false,
            isError: true,
          );
        },
        (SearchResponse r) {
          return SearchState(
            searchResultData: r.results,
            idleList: [],
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(_state);
    });
  }
}
