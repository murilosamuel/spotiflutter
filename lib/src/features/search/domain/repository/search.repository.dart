import 'package:dartz/dartz.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/features/common/domain/entities/fetch_result.entity.dart';
import 'package:spotiflutter/src/features/search/domain/entities/search_result.entity.dart';

abstract class SearchRepository {
  Future<Either<SpotiflutterException, FetchResult<SearchResult>>> fetch(String filter);
}
