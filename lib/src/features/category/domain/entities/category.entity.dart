import 'package:spotiflutter/src/features/common/domain/entities/image_content.entity.dart';

class Category {
  final String? href;
  final List<ImageContent>? icons;
  final String? id;
  final String? name;

  Category({
    required this.href,
    required this.icons,
    required this.id,
    required this.name,
  });

  @override
  String toString() {
    return '$name';
  }
}
