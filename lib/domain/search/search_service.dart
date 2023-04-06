import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/search/models/search_response.dart';

abstract class SearchRepo {
  Future<Either<MainFailure, SearchResponse>> searchMovies({
    required String movieQuerry,
  });
}
