import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/features/common/domain/entities/fetch_result.entity.dart';
import 'package:spotiflutter/src/features/playlist/domain/entities/playlist.entity.dart';
import 'package:spotiflutter/src/features/playlist/domain/repository/playlist.repository.dart';
import 'package:spotiflutter/src/features/playlist/domain/usecases/fetch_playlists.usecase.dart';

@Injectable(as: FetchPlaylistsUseCase)
class FetchPlaylistsUseCaseImp implements FetchPlaylistsUseCase {
  final PlaylistRepository repository;

  FetchPlaylistsUseCaseImp(this.repository);

  @override
  Future<Either<SpotiflutterException, FetchResult<Playlist>>> call({
    required String? filter,
    int? limit,
    int? offset,
    String? market,
  }) {
    return repository.fetch(
      filter: filter,
      limit: limit,
      offset: offset,
      market: market,
    );
  }
}
