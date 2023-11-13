import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/mapper/entity_mapper.dart';
import 'package:spotiflutter/src/features/common/data/dto/image_content.dto.dart';
import 'package:spotiflutter/src/features/common/domain/entities/image_content.entity.dart';

@Injectable()
class ImageContentMapper
    implements EntityMapper<ImageContentDto, ImageContent> {
  @override
  ImageContent from(ImageContentDto object) {
    return ImageContent(
      height: object.height,
      width: object.width,
      url: object.url,
    );
  }

  @override
  ImageContentDto to(ImageContent object) {
    return ImageContentDto(
      height: object.height,
      width: object.width,
      url: object.url,
    );
  }
}
