import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/exceptions/database_error.exception.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/features/category/datasource/data/datasource/category_database.datasource.dart';
import 'package:spotiflutter/src/features/category/datasource/data/dto/category.dto.dart';
import 'package:spotiflutter/src/features/common/data/dto/fetch_result.dto.dart';

@Injectable(as: CategoryDatabaseDataSource)
class CategoryDatabaseDataSourceImp implements CategoryDatabaseDataSource {
  @override
  Future<Either<SpotiflutterException, FetchResultDto<CategoryDto>>>
      fetch() async {
    try {
      var box = await Hive.openBox('category');
      List<CategoryDto> categories = [];

      for (var key in box.keys) {
        var categoryMap = box.get(key);
        CategoryDto category = CategoryDto.fromJson(categoryMap);
        categories.add(category);
      }
      await box.close();

      var result = FetchResultDto<CategoryDto>(
        payload: categories,
        isLast: true,
      );
      return Right(result);
    } catch (ex) {
      return Left(
        DatabaseErrorException(
          message: 'Error on fetching categories from database: $ex}',
        ),
      );
    }
  }

  @override
  Future<Either<SpotiflutterException, bool>> save(CategoryDto dto) async {
    try {
      var box = await Hive.openBox('category');
      await box.put(dto.id, dto.toJson());
      await box.close();
      return const Right(true);
    } catch (ex) {
      return Left(
        DatabaseErrorException(message: 'Error on save category: $ex}'),
      );
    }
  }
}
