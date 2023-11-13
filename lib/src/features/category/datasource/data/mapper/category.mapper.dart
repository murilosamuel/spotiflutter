import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/mapper/entity_mapper.dart';
import 'package:spotiflutter/src/features/category/datasource/data/dto/category.dto.dart';
import 'package:spotiflutter/src/features/category/domain/entities/category.entity.dart';
import 'package:spotiflutter/src/features/common/data/mapper/image_content.mapper.dart';

@Injectable()
class CategoryMapper implements EntityMapper<CategoryDto, Category> {
  final ImageContentMapper imageContentMapper;

  CategoryMapper(this.imageContentMapper);

  @override
  Category from(CategoryDto object) {
    return Category(
      href: object.href,
      icons: object.icons != null
          ? object.icons!.map((e) => imageContentMapper.from(e)).toList()
          : null,
      id: object.id,
      name: object.name,
    );
  }

  @override
  CategoryDto to(Category object) {
    return CategoryDto(
      href: object.href,
      icons: object.icons != null
          ? object.icons!.map((e) => imageContentMapper.to(e)).toList()
          : null,
      id: object.id,
      name: object.name,
    );
  }
}
