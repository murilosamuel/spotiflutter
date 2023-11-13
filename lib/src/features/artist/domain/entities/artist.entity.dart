import 'package:spotiflutter/src/features/common/domain/entities/external_urls.entity.dart';
import 'package:spotiflutter/src/features/common/domain/entities/followers.entity.dart';
import 'package:spotiflutter/src/features/common/domain/entities/image_content.entity.dart';

class Artist {
  final ExternalUrls? externalUrls;
  final Followers? followers;
  final List<String>? genres;
  final String? href;
  final String? id;
  final List<ImageContent>? images;
  final String? name;
  final num? popularity;
  final String? type;
  final String? uri;

  Artist({
    this.externalUrls,
    this.followers,
    this.genres,
    this.href,
    this.id,
    this.images,
    this.name,
    this.popularity,
    this.type,
    this.uri,
  });

  @override
  String toString() {
    return '$name';
  }
}
