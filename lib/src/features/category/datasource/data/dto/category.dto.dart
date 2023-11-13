import 'package:spotiflutter/src/features/common/data/dto/image_content.dto.dart';

class CategoryDto {
  final String? href;
  final List<ImageContentDto>? icons;
  final String? id;
  final String? name;

  CategoryDto({
    required this.href,
    required this.icons,
    required this.id,
    required this.name,
  });

  factory CategoryDto.fromJson(Map<dynamic, dynamic> json) {
    return CategoryDto(
      href: json['href'],
      icons: json['icons'] == null
          ? []
          : List<ImageContentDto>.from(
              json['icons']!.map((x) => ImageContentDto.fromJson(x)),
            ),
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'href': href,
        'icons': icons?.map((x) => x.toJson()).toList(),
        'id': id,
        'name': name,
      };

  @override
  String toString() {
    return '$name';
  }
}
