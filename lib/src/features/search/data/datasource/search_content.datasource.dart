import 'package:dartz/dartz.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/features/common/data/dto/fetch_result.dto.dart';
import 'package:spotiflutter/src/features/search/data/dto/search_result.dto.dart';

abstract class SearchContentDataSource{
  Future<Either<SpotiflutterException, FetchResultDto<SearchResultDto>>> fetch(String filter);
}