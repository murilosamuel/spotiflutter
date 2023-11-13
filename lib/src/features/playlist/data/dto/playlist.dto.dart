import 'package:spotiflutter/src/features/common/data/dto/external_urls.dto.dart';
import 'package:spotiflutter/src/features/common/data/dto/followers.dto.dart';
import 'package:spotiflutter/src/features/common/data/dto/image_content.dto.dart';
import 'package:spotiflutter/src/features/playlist/data/dto/owner.dto.dart';
import 'package:spotiflutter/src/features/playlist/data/dto/playlist_track.dto.dart';

class PlaylistDto {
  final bool? collaborative;
  final String? description;
  final ExternalUrlsDto? externalUrls;
  final FollowersDto? followers;
  final String? href;
  final String? id;
  final List<ImageContentDto>? images;
  final String? name;
  final OwnerDto? owner;
  final bool? public;
  final String? snapshotId;
  final PlaylistTrackDto? tracks;
  final String? type;
  final String? uri;

  PlaylistDto({
    this.collaborative,
    this.description,
    this.externalUrls,
    this.followers,
    this.href,
    this.id,
    this.images,
    this.name,
    this.owner,
    this.public,
    this.snapshotId,
    this.tracks,
    this.type,
    this.uri,
  });

  factory PlaylistDto.fromJson(Map<String, dynamic> json) {
    return PlaylistDto(
      collaborative: json['collaborative'],
      description: json['description'],
      externalUrls: json['external_urls'] == null
          ? null
          : ExternalUrlsDto.fromJson(json['external_urls']),
      followers: json['followers'] == null
          ? null
          : FollowersDto.fromJson(json['followers']),
      href: json['href'],
      id: json['id'],
      images: json['images'] == null
          ? []
          : List<ImageContentDto>.from(json['images']!.map((x) => ImageContentDto.fromJson(x))),
      name: json['name'],
      owner: json['owner'] == null ? null : OwnerDto.fromJson(json['owner']),
      public: json['public'],
      snapshotId: json['snapshot_id'],
      tracks: json['tracks'] == null ? null : PlaylistTrackDto.fromJson(json['tracks']),
      type: json['type'],
      uri: json['uri'],
    );
  }

  Map<String, dynamic> toJson() => {
        'collaborative': collaborative,
        'description': description,
        'external_urls': externalUrls?.toJson(),
        'followers': followers?.toJson(),
        'href': href,
        'id': id,
        'images': images?.map((x) => x.toJson()).toList(),
        'name': name,
        'owner': owner?.toJson(),
        'public': public,
        'snapshot_id': snapshotId,
        'tracks': tracks?.toJson(),
        'type': type,
        'uri': uri,
      };

  @override
  String toString() {
    return description ?? '';
  }
}
