import 'package:spotiflutter/src/features/common/data/dto/external_urls.dto.dart';
import 'package:spotiflutter/src/features/common/data/dto/followers.dto.dart';

class OwnerDto {
  final ExternalUrlsDto? externalUrls;
  final FollowersDto? followers;
  final String? href;
  final String? id;
  final String? type;
  final String? uri;
  final String? displayName;
  final String? name;

  OwnerDto({
    this.externalUrls,
    this.followers,
    this.href,
    this.id,
    this.type,
    this.uri,
    this.displayName,
    this.name,
  });

  factory OwnerDto.fromJson(Map<String, dynamic> json) {
    return OwnerDto(
      externalUrls: json['external_urls'] == null
          ? null
          : ExternalUrlsDto.fromJson(json['external_urls']),
      followers: json['followers'] == null
          ? null
          : FollowersDto.fromJson(json['followers']),
      href: json['href'],
      id: json['id'],
      type: json['type'],
      uri: json['uri'],
      displayName: json['display_name'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
    'external_urls': externalUrls?.toJson(),
    'followers': followers?.toJson(),
    'href': href,
    'id': id,
    'type': type,
    'uri': uri,
    'display_name': displayName,
    'name': name,
  };

  @override
  String toString() {
    return '$displayName - $name - $followers';
  }
}