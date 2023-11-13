import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/mapper/entity_mapper.dart';
import 'package:spotiflutter/src/features/common/data/dto/restrictions.dto.dart';
import 'package:spotiflutter/src/features/common/domain/entities/restrictions.entity.dart';

@Injectable()
class RestrictionsMapper
    implements EntityMapper<RestrictionsDto, Restrictions> {
  @override
  Restrictions from(RestrictionsDto object) {
    return Restrictions(reason: object.reason);
  }

  @override
  RestrictionsDto to(Restrictions object) {
    return RestrictionsDto(reason: object.reason);
  }
}
