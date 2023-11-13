import 'package:spotiflutter/src/features/common/data/dto/external_urls.dto.dart';
import 'package:spotiflutter/src/features/common/data/dto/followers.dto.dart';
import 'package:spotiflutter/src/features/common/data/dto/image_content.dto.dart';

class ArtistDto {
  final ExternalUrlsDto? externalUrls;
  final FollowersDto? followers;
  final List<String>? genres;
  final String? href;
  final String? id;
  final List<ImageContentDto>? images;
  final String? name;
  final num? popularity;
  final String? type;
  final String? uri;

  ArtistDto({
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

  factory ArtistDto.fromJson(Map<String, dynamic> json) {
    return ArtistDto(
      externalUrls: json['external_urls'] == null
          ? null
          : ExternalUrlsDto.fromJson(json['external_urls']),
      followers: json['followers'] == null
          ? null
          : FollowersDto.fromJson(json['followers']),
      genres: json['genres'] == null
          ? []
          : List<String>.from(json['genres']!.map((x) => x)),
      href: json['href'],
      id: json['id'],
      images: json['images'] == null
          ? []
          : List<ImageContentDto>.from(
              json['images']!.map((x) => ImageContentDto.fromJson(x))),
      name: json['name'],
      popularity: json['popularity'],
      type: json['type'],
      uri: json['uri'],
    );
  }

  Map<String, dynamic> toJson() => {
        'external_urls': externalUrls?.toJson(),
        'followers': followers?.toJson(),
        'genres': genres?.map((x) => x).toList(),
        'href': href,
        'id': id,
        'images': images?.map((x) => x.toJson()).toList(),
        'name': name,
        'popularity': popularity,
        'type': type,
        'uri': uri,
      };

  @override
  String toString() {
    return '$name';
  }
}
