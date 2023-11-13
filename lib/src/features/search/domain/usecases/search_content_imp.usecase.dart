import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/features/common/domain/entities/fetch_result.entity.dart';
import 'package:spotiflutter/src/features/search/domain/entities/search_result.entity.dart';
import 'package:spotiflutter/src/features/search/domain/repository/search.repository.dart';
import 'package:spotiflutter/src/features/search/domain/usecases/search_content.usecase.dart';


@Injectable(as: SearchContentUseCase)
class SearchContentUseCaseImp implements SearchContentUseCase {
  final SearchRepository repository;

  SearchContentUseCaseImp(this.repository);

  @override
  Future<Either<SpotiflutterException, FetchResult<SearchResult>>> call(filter) {
    return repository.fetch(filter);
  }

}
