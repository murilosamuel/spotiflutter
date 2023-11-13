import 'package:dartz/dartz.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/features/common/domain/entities/fetch_result.entity.dart';
import 'package:spotiflutter/src/features/category/domain/entities/category.entity.dart';

abstract class FetchCategoriesUseCase {
  Future<Either<SpotiflutterException, FetchResult<Category>>> call({
    int? limit,
    int? offset,
    String? country,
  });
}
