import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/features/category/domain/entities/category.entity.dart';
import 'package:spotiflutter/src/features/category/domain/repository/category.repository.dart';
import 'package:spotiflutter/src/features/category/domain/usecases/fetch_playlists.usecase.dart';
import 'package:spotiflutter/src/features/common/domain/entities/fetch_result.entity.dart';

@Injectable(as: FetchCategoriesUseCase)
class FetchCategoriesUseCaseImp implements FetchCategoriesUseCase {
  final CategoryRepository repository;

  FetchCategoriesUseCaseImp(this.repository);

  @override
  Future<Either<SpotiflutterException, FetchResult<Category>>> call({
    int? limit,
    int? offset,
    String? country,
  }) {
    return repository.fetch(
      offset: offset,
      limit: limit,
      country: country,
    );
  }
}
