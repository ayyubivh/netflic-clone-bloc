import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:netflix_clone/domain/search/models/search_response.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/search/search_service.dart';
import '../../domain/core/api_end_points.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SearchRepo)
class SeachRepository implements SearchRepo {
  @override
  Future<Either<MainFailure, SearchResponse>> searchMovies(
      {required String movieQuerry}) async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.search,
        queryParameters: {
          'query': movieQuerry,
        },
      );
      // log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResponse.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
