import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/mapper/entity_mapper.dart';
import 'package:spotiflutter/src/features/album/data/mapper/album.mapper.dart';
import 'package:spotiflutter/src/features/artist/data/mapper/artist.mapper.dart';
import 'package:spotiflutter/src/features/common/data/mapper/external_url.mapper.dart';
import 'package:spotiflutter/src/features/common/data/mapper/restrictions.mapper.dart';
import 'package:spotiflutter/src/features/track/data/dto/track.dto.dart';
import 'package:spotiflutter/src/features/track/domain/entities/track.entity.dart';

@Injectable()
class TrackMapper implements EntityMapper<TrackDto, Track> {
  final ExternalUrlsMapper externalUrlsMapper;
  final RestrictionsMapper restrictionsMapper;
  final ArtistMapper artistMapper;
  final AlbumMapper albumMapper;

  TrackMapper(
    this.externalUrlsMapper,
    this.restrictionsMapper,
    this.artistMapper,
    this.albumMapper,
  );

  @override
  Track from(TrackDto object) {
    return Track(
      isLocal: object.isLocal,
      href: object.href,
      uri: object.uri,
      externalUrls: object.externalUrls != null
          ? externalUrlsMapper.from(object.externalUrls!)
          : null,
      type: object.type,
      name: object.name,
      id: object.id,
      popularity: object.popularity,
      restrictions: object.restrictions != null
          ? restrictionsMapper.from(object.restrictions!)
          : null,
      availableMarkets: object.availableMarkets,
      artists: object.artists != null
          ? object.artists!.map((e) => artistMapper.from(e)).toList()
          : null,
      album: object.album != null ? albumMapper.from(object.album!) : null,
      discNumber: object.discNumber,
      durationMs: object.durationMs,
      explicit: object.explicit,
      isPlayable: object.isPlayable,
      previewUrl: object.previewUrl,
      trackNumber: object.trackNumber,
    );
  }

  @override
  TrackDto to(Track object) {
    return TrackDto(
      isLocal: object.isLocal,
      href: object.href,
      uri: object.uri,
      externalUrls: object.externalUrls != null
          ? externalUrlsMapper.to(object.externalUrls!)
          : null,
      type: object.type,
      name: object.name,
      id: object.id,
      popularity: object.popularity,
      restrictions: object.restrictions != null
          ? restrictionsMapper.to(object.restrictions!)
          : null,
      availableMarkets: object.availableMarkets,
      artists: object.artists != null
          ? object.artists!.map((e) => artistMapper.to(e)).toList()
          : null,
      album: object.album != null ? albumMapper.to(object.album!) : null,
      discNumber: object.discNumber,
      durationMs: object.durationMs,
      explicit: object.explicit,
      isPlayable: object.isPlayable,
      previewUrl: object.previewUrl,
      trackNumber: object.trackNumber,
    );
  }
}
