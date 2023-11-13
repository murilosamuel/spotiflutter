import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/mapper/entity_mapper.dart';
import 'package:spotiflutter/src/features/artist/data/dto/artist.dto.dart';
import 'package:spotiflutter/src/features/artist/domain/entities/artist.entity.dart';
import 'package:spotiflutter/src/features/common/data/mapper/external_url.mapper.dart';
import 'package:spotiflutter/src/features/common/data/mapper/followers.mapper.dart';
import 'package:spotiflutter/src/features/common/data/mapper/image_content.mapper.dart';

@Injectable()
class ArtistMapper implements EntityMapper<ArtistDto, Artist> {
  final ImageContentMapper imageContentMapper;
  final ExternalUrlsMapper externalUrlsMapper;
  final FollowersMapper followersMapper;

  ArtistMapper(
    this.imageContentMapper,
    this.externalUrlsMapper,
    this.followersMapper,
  );

  @override
  Artist from(ArtistDto object) {
    return Artist(
      href: object.href,
      uri: object.uri,
      images: object.images != null
          ? object.images!.map((e) => imageContentMapper.from(e)).toList()
          : null,
      externalUrls: object.externalUrls != null
          ? externalUrlsMapper.from(object.externalUrls!)
          : null,
      type: object.type,
      name: object.name,
      id: object.id,
      followers: object.followers != null
          ? followersMapper.from(object.followers!)
          : null,
      genres: object.genres,
      popularity: object.popularity,
    );
  }

  @override
  ArtistDto to(Artist object) {
    return ArtistDto(
      href: object.href,
      uri: object.uri,
      images: object.images != null
          ? object.images!.map((e) => imageContentMapper.to(e)).toList()
          : null,
      externalUrls: object.externalUrls != null
          ? externalUrlsMapper.to(object.externalUrls!)
          : null,
      type: object.type,
      name: object.name,
      id: object.id,
      followers: object.followers != null
          ? followersMapper.to(object.followers!)
          : null,
      genres: object.genres,
      popularity: object.popularity,
    );
  }
}
