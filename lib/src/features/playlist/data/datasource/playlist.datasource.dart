import 'package:dartz/dartz.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/features/common/data/dto/fetch_result.dto.dart';
import 'package:spotiflutter/src/features/playlist/data/dto/playlist.dto.dart';

abstract class PlaylistDataSource {
  Future<Either<SpotiflutterException, FetchResultDto<PlaylistDto>>> fetch({
    String? filter,
    int? limit,
    int? offset,
    String? market,
  });
}
