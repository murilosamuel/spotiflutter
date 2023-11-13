import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/core/mapper/repository_parser_util.dart';
import 'package:spotiflutter/src/features/common/domain/entities/fetch_result.entity.dart';
import 'package:spotiflutter/src/features/playlist/data/datasource/playlist.datasource.dart';
import 'package:spotiflutter/src/features/playlist/data/dto/playlist.dto.dart';
import 'package:spotiflutter/src/features/playlist/data/mapper/playlist.mapper.dart';
import 'package:spotiflutter/src/features/playlist/domain/entities/playlist.entity.dart';
import 'package:spotiflutter/src/features/playlist/domain/repository/playlist.repository.dart';

@Injectable(as: PlaylistRepository)
class PlaylistRepositoryImp implements PlaylistRepository {
  final PlaylistDataSource dataSource;
  final PlaylistMapper mapper;
  late RepositoryParserUtil<Playlist, PlaylistDto> parser;

  PlaylistRepositoryImp(
    this.dataSource,
    this.mapper,
  ) {
    parser = RepositoryParserUtil<Playlist, PlaylistDto>(mapper);
  }

  @override
  Future<Either<SpotiflutterException, FetchResult<Playlist>>> fetch({
    String? filter,
    int? limit,
    int? offset,
    String? market,
  }) async {
    var result = await dataSource.fetch(
      filter: filter,
      offset: offset,
      limit: limit,
      market: market,
    );
    return parser.parseList(result);
  }
}
