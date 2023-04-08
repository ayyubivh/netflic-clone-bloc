// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';

import 'package:netflix_clone/domain/hot_and_new/hot_and_new_repo.dart';
import 'package:netflix_clone/domain/hot_and_new/model/hot_and_new_response.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewRepo homeRepo;
  HomeBloc(
    this.homeRepo,
  ) : super(HomeState.initial()) {
    on<GetHomeScreenData>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        hasError: false,
      ));
      final movieResult = await homeRepo.getHotAndNewMovieData();
      final tvResult = await homeRepo.getHotAndNewTvData();
      final state1 = movieResult.fold(
        (MainFailure failure) {
          return HomeState(
              stateId: DateTime.now().microsecondsSinceEpoch.toString(),
              pastYearMovieList: [],
              trendingMovieList: [],
              tenseDramaMovieList: [],
              southIndianMovieList: [],
              trendingTvList: [],
              isLoading: false,
              hasError: true);
        },
        (HotAndNewResp resp) {
          final pastYear = resp.results;
          final trending = resp.results;
          final dramas = resp.results;
          final southIndian = resp.results;

          pastYear.shuffle();
          trending.shuffle();
          dramas.shuffle();
          southIndian.shuffle();

          return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: pastYear,
            trendingMovieList: trending,
            tenseDramaMovieList: dramas,
            southIndianMovieList: southIndian,
            trendingTvList: state.trendingTvList,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(state1);
      final state2 = tvResult.fold((MainFailure failure) {
        return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseDramaMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {
        final top10List = resp.results;

        return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: state.pastYearMovieList,
            trendingMovieList: top10List,
            tenseDramaMovieList: state.tenseDramaMovieList,
            southIndianMovieList: state.southIndianMovieList,
            trendingTvList: top10List,
            isLoading: false,
            hasError: false);
      });
      emit(state2);
    });
  }
}
