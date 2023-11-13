import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/mapper/entity_mapper.dart';
import 'package:spotiflutter/src/features/common/data/dto/external_urls.dto.dart';
import 'package:spotiflutter/src/features/common/domain/entities/external_urls.entity.dart';

@Injectable()
class ExternalUrlsMapper
    implements EntityMapper<ExternalUrlsDto, ExternalUrls> {
  @override
  ExternalUrls from(ExternalUrlsDto object) {
    return ExternalUrls(spotify: object.spotify);
  }

  @override
  ExternalUrlsDto to(ExternalUrls object) {
    return ExternalUrlsDto(spotify: object.spotify);
  }
}
