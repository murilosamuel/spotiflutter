import 'package:dartz/dartz.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/features/category/datasource/data/dto/category.dto.dart';
import 'package:spotiflutter/src/features/common/data/dto/fetch_result.dto.dart';

abstract class CategoryApiDataSource {
  Future<Either<SpotiflutterException, FetchResultDto<CategoryDto>>> fetch({
    String? filter,
    int? limit,
    int? offset,
    String? country,
  });
}
