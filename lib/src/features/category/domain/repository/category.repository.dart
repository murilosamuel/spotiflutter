import 'package:dartz/dartz.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/features/category/domain/entities/category.entity.dart';
import 'package:spotiflutter/src/features/common/domain/entities/fetch_result.entity.dart';

abstract class CategoryRepository {
  Future<Either<SpotiflutterException, FetchResult<Category>>> fetch({
    int? limit,
    int? offset,
    String? country,
  });
}
