import 'package:dartz/dartz.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/core/exceptions/unexpected.exception.dart';
import 'package:spotiflutter/src/features/common/data/dto/fetch_result.dto.dart';
import 'package:spotiflutter/src/features/common/domain/entities/fetch_result.entity.dart';
import 'entity_mapper.dart';

class RepositoryParserUtil<T, F> {
  final EntityMapper<F, T> entityMapper;

  RepositoryParserUtil(this.entityMapper);

  Either<SpotiflutterException, FetchResult<T>> parseList(
    Either<SpotiflutterException, FetchResultDto<F>> result,
  ) {
    if (result.isRight()) {
      final fetch = (result as Right).value as FetchResultDto<F>;
      final entityList =
          List<T>.of(fetch.payload?.map((e) => entityMapper.from(e)) ?? []);
      return Right(FetchResult(
        isLast: fetch.isLast,
        payload: entityList,
      ));
    } else {
      return Left((result as Left).value);
    }
  }

  Either<SpotiflutterException, T> parse(
    Either<SpotiflutterException, F?> result,
  ) {
    if (result.isRight()) {
      F? dto = (result as Right).value as F?;
      if (dto != null) {
        return Right(entityMapper.from(dto));
      } else {
        return Left(UnexpectedException('Unexpected error on parse object'));
      }
    } else {
      return Left((result as Left).value);
    }
  }
}
