import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/mapper/entity_mapper.dart';
import 'package:spotiflutter/src/features/common/data/mapper/external_url.mapper.dart';
import 'package:spotiflutter/src/features/common/data/mapper/followers.mapper.dart';
import 'package:spotiflutter/src/features/playlist/data/dto/owner.dto.dart';
import 'package:spotiflutter/src/features/playlist/domain/entities/owner.entity.dart';

@Injectable()
class OwnerMapper implements EntityMapper<OwnerDto, Owner> {
  final ExternalUrlsMapper externalUrlsMapper;
  final FollowersMapper followersMapper;

  OwnerMapper(
    this.externalUrlsMapper,
    this.followersMapper,
  );

  @override
  Owner from(OwnerDto object) {
    return Owner(
      id: object.id,
      name: object.name,
      type: object.type,
      externalUrls: object.externalUrls != null
          ? externalUrlsMapper.from(object.externalUrls!)
          : null,
      uri: object.uri,
      href: object.href,
      followers: object.followers != null
          ? followersMapper.from(object.followers!)
          : null,
      displayName: object.displayName,
    );
  }

  @override
  OwnerDto to(Owner object) {
    return OwnerDto(
      id: object.id,
      name: object.name,
      type: object.type,
      externalUrls: object.externalUrls != null
          ? externalUrlsMapper.to(object.externalUrls!)
          : null,
      uri: object.uri,
      href: object.href,
      followers: object.followers != null
          ? followersMapper.to(object.followers!)
          : null,
      displayName: object.displayName,
    );
  }
}
