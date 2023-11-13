import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/mapper/entity_mapper.dart';
import 'package:spotiflutter/src/features/album/data/dto/album.dto.dart';
import 'package:spotiflutter/src/features/album/domain/entities/album.entity.dart';
import 'package:spotiflutter/src/features/artist/data/mapper/artist.mapper.dart';
import 'package:spotiflutter/src/features/common/data/mapper/external_url.mapper.dart';
import 'package:spotiflutter/src/features/common/data/mapper/image_content.mapper.dart';
import 'package:spotiflutter/src/features/common/data/mapper/restrictions.mapper.dart';

@Injectable()
class AlbumMapper implements EntityMapper<AlbumDto, Album> {
  final ArtistMapper artistMapper;
  final ExternalUrlsMapper externalUrlsMapper;
  final ImageContentMapper imageContentMapper;
  final RestrictionsMapper restrictionsMapper;

  AlbumMapper(
    this.artistMapper,
    this.externalUrlsMapper,
    this.imageContentMapper,
    this.restrictionsMapper,
  );

  @override
  Album from(AlbumDto object) {
    return Album(
      id: object.id,
      name: object.name,
      type: object.type,
      albumType: object.albumType,
      artists: object.artists != null
          ? object.artists!.map((e) => artistMapper.from(e)).toList()
          : null,
      availableMarkets: object.availableMarkets,
      externalUrls: object.externalUrls != null
          ? externalUrlsMapper.from(object.externalUrls!)
          : null,
      href: object.href,
      images: object.images != null
          ? object.images!.map((e) => imageContentMapper.from(e)).toList()
          : null,
      releaseDate: object.releaseDate,
      releaseDatePrecision: object.releaseDatePrecision,
      restrictions: object.restrictions != null
          ? restrictionsMapper.from(object.restrictions!)
          : null,
      totalTracks: object.totalTracks,
      uri: object.uri,
    );
  }

  @override
  AlbumDto to(Album object) {
    return AlbumDto(
      id: object.id,
      name: object.name,
      type: object.type,
      albumType: object.albumType,
      artists: object.artists != null
          ? object.artists!.map((e) => artistMapper.to(e)).toList()
          : null,
      availableMarkets: object.availableMarkets,
      externalUrls: object.externalUrls != null
          ? externalUrlsMapper.to(object.externalUrls!)
          : null,
      href: object.href,
      images: object.images != null
          ? object.images!.map((e) => imageContentMapper.to(e)).toList()
          : null,
      releaseDate: object.releaseDate,
      releaseDatePrecision: object.releaseDatePrecision,
      restrictions: object.restrictions != null
          ? restrictionsMapper.to(object.restrictions!)
          : null,
      totalTracks: object.totalTracks,
      uri: object.uri,
    );
  }
}
