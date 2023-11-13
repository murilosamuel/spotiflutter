import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/mapper/entity_mapper.dart';
import 'package:spotiflutter/src/features/common/data/dto/followers.dto.dart';
import 'package:spotiflutter/src/features/common/domain/entities/followers.entity.dart';

@Injectable()
class FollowersMapper implements EntityMapper<FollowersDto, Followers> {
  @override
  Followers from(FollowersDto object) {
    return Followers(
      total: object.total,
      href: object.href,
    );
  }

  @override
  FollowersDto to(Followers object) {
    return FollowersDto(
      href: object.href,
      total: object.total,
    );
  }
}
