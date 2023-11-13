import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/mapper/entity_mapper.dart';
import 'package:spotiflutter/src/features/album/data/mapper/album.mapper.dart';
import 'package:spotiflutter/src/features/artist/data/mapper/artist.mapper.dart';
import 'package:spotiflutter/src/features/playlist/data/mapper/playlist.mapper.dart';
import 'package:spotiflutter/src/features/search/data/dto/search_result.dto.dart';
import 'package:spotiflutter/src/features/search/domain/entities/search_result.entity.dart';
import 'package:spotiflutter/src/features/track/data/mapper/track.mapper.dart';

@Injectable()
class SearchResultMapper
    implements EntityMapper<SearchResultDto, SearchResult> {
  final TrackMapper trackMapper;
  final PlaylistMapper playlistMapper;
  final AlbumMapper albumMapper;
  final ArtistMapper artistMapper;

  SearchResultMapper(
    this.trackMapper,
    this.playlistMapper,
    this.albumMapper,
    this.artistMapper,
  );

  @override
  SearchResult from(SearchResultDto object) {
    return SearchResult(
      tracks: object.tracks != null
          ? object.tracks!.map((e) => trackMapper.from(e)).toList()
          : null,
      playlists: object.playlists != null
          ? object.playlists!.map((e) => playlistMapper.from(e)).toList()
          : null,
      albums: object.albums != null
          ? object.albums!.map((e) => albumMapper.from(e)).toList()
          : null,
      artists: object.artists != null
          ? object.artists!.map((e) => artistMapper.from(e)).toList()
          : null,
    );
  }

  @override
  SearchResultDto to(SearchResult object) {
    return SearchResultDto(
      tracks: object.tracks != null
          ? object.tracks!.map((e) => trackMapper.to(e)).toList()
          : null,
      playlists: object.playlists != null
          ? object.playlists!.map((e) => playlistMapper.to(e)).toList()
          : null,
      albums: object.albums != null
          ? object.albums!.map((e) => albumMapper.to(e)).toList()
          : null,
      artists: object.artists != null
          ? object.artists!.map((e) => artistMapper.to(e)).toList()
          : null,
    );
  }
}
