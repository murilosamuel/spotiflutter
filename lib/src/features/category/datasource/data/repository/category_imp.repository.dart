import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/core/mapper/repository_parser_util.dart';
import 'package:spotiflutter/src/features/category/datasource/data/datasource/category_api.datasource.dart';
import 'package:spotiflutter/src/features/category/datasource/data/datasource/category_database.datasource.dart';
import 'package:spotiflutter/src/features/category/datasource/data/dto/category.dto.dart';
import 'package:spotiflutter/src/features/category/datasource/data/mapper/category.mapper.dart';
import 'package:spotiflutter/src/features/category/domain/entities/category.entity.dart';
import 'package:spotiflutter/src/features/category/domain/repository/category.repository.dart';
import 'package:spotiflutter/src/features/common/data/dto/fetch_result.dto.dart';
import 'package:spotiflutter/src/features/common/domain/entities/fetch_result.entity.dart';

@Injectable(as: CategoryRepository)
class CategoryRepositoryImp implements CategoryRepository {
  final CategoryApiDataSource apiDataSource;
  final CategoryDatabaseDataSource databaseDataSource;
  final CategoryMapper mapper;
  late RepositoryParserUtil<Category, CategoryDto> parser;

  CategoryRepositoryImp(
    this.apiDataSource,
    this.databaseDataSource,
    this.mapper,
  ) {
    parser = RepositoryParserUtil<Category, CategoryDto>(mapper);
  }

  @override
  Future<Either<SpotiflutterException, FetchResult<Category>>> fetch({
    int? limit,
    int? offset,
    String? country,
  }) async {
    Either<SpotiflutterException, FetchResultDto<CategoryDto>>? result;
    bool hasConnection = await InternetConnectionChecker().hasConnection;
    if (hasConnection == true) {
      result = await apiDataSource.fetch(
        limit: limit,
        offset: offset,
        country: country,
      );
      if (result.isRight()) {
        FetchResultDto<CategoryDto> resultDto = (result as Right).value;
        resultDto.payload?.forEach((dto) async {
          await databaseDataSource.save(dto);
        });
      }
    } else {
      result = await databaseDataSource.fetch();
    }

    return parser.parseList(result);
  }
}
