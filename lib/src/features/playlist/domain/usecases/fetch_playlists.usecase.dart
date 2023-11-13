import 'package:dartz/dartz.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/features/common/domain/entities/fetch_result.entity.dart';
import 'package:spotiflutter/src/features/playlist/domain/entities/playlist.entity.dart';

abstract class FetchPlaylistsUseCase {
  Future<Either<SpotiflutterException, FetchResult<Playlist>>> call({
    required String? filter,
    int? limit,
    int? offset,
    String? market,
  });
}
