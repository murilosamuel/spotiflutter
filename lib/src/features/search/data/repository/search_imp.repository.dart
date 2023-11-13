import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/core/mapper/repository_parser_util.dart';
import 'package:spotiflutter/src/features/category/datasource/data/datasource/category_api.datasource.dart';
import 'package:spotiflutter/src/features/category/datasource/data/dto/category.dto.dart';
import 'package:spotiflutter/src/features/category/datasource/data/mapper/category.mapper.dart';
import 'package:spotiflutter/src/features/category/domain/entities/category.entity.dart';
import 'package:spotiflutter/src/features/category/domain/repository/category.repository.dart';
import 'package:spotiflutter/src/features/common/domain/entities/fetch_result.entity.dart';
import 'package:spotiflutter/src/features/search/data/datasource/search_content.datasource.dart';
import 'package:spotiflutter/src/features/search/data/dto/search_result.dto.dart';
import 'package:spotiflutter/src/features/search/data/mapper/search_result.mapper.dart';
import 'package:spotiflutter/src/features/search/domain/entities/search_result.entity.dart';
import 'package:spotiflutter/src/features/search/domain/repository/search.repository.dart';

@Injectable(as: SearchRepository)
class SearchRepositoryImp implements SearchRepository {
  final SearchContentDataSource dataSource;
  final SearchResultMapper mapper;
  late RepositoryParserUtil<SearchResult, SearchResultDto> parser;

  SearchRepositoryImp(this.dataSource, this.mapper) {
    parser = RepositoryParserUtil<SearchResult, SearchResultDto>(mapper);
  }

  @override
  Future<Either<SpotiflutterException, FetchResult<SearchResult>>> fetch(String filter) async {
    var result = await dataSource.fetch(filter);
    return parser.parseList(result);
  }
}
