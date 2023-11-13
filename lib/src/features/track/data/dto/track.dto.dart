import 'package:spotiflutter/src/features/album/data/dto/album.dto.dart';
import 'package:spotiflutter/src/features/artist/data/dto/artist.dto.dart';
import 'package:spotiflutter/src/features/common/data/dto/external_urls.dto.dart';
import 'package:spotiflutter/src/features/common/data/dto/restrictions.dto.dart';

class TrackDto {
  final AlbumDto? album;
  final List<ArtistDto>? artists;
  final List<String>? availableMarkets;
  final num? discNumber;
  final num? durationMs;
  final bool? explicit;
  final ExternalUrlsDto? externalUrls;
  final String? href;
  final String? id;
  final bool? isPlayable;
  final RestrictionsDto? restrictions;
  final String? name;
  final num? popularity;
  final String? previewUrl;
  final num? trackNumber;
  final String? type;
  final String? uri;
  final bool? isLocal;

  TrackDto({
    this.album,
    this.artists,
    this.availableMarkets,
    this.discNumber,
    this.durationMs,
    this.explicit,
    this.externalUrls,
    this.href,
    this.id,
    this.isPlayable,
    this.restrictions,
    this.name,
    this.popularity,
    this.previewUrl,
    this.trackNumber,
    this.type,
    this.uri,
    this.isLocal,
  });

  factory TrackDto.fromJson(Map<String, dynamic> json) {
    return TrackDto(
      album: json['album'] == null ? null : AlbumDto.fromJson(json['album']),
      artists: json['artists'] == null
          ? []
          : List<ArtistDto>.from(json['artists']!.map((x) => ArtistDto.fromJson(x))),
      availableMarkets: json['available_markets'] == null
          ? []
          : List<String>.from(json['available_markets']!.map((x) => x)),
      discNumber: json['disc_number'],
      durationMs: json['duration_ms'],
      explicit: json['explicit'],
      externalUrls: json['external_urls'] == null
          ? null
          : ExternalUrlsDto.fromJson(json['external_urls']),
      href: json['href'],
      id: json['id'],
      isPlayable: json['is_playable'],
      restrictions: json['restrictions'] == null
          ? null
          : RestrictionsDto.fromJson(json['restrictions']),
      name: json['name'],
      popularity: json['popularity'],
      previewUrl: json['preview_url'],
      trackNumber: json['track_number'],
      type: json['type'],
      uri: json['uri'],
      isLocal: json['is_local'],
    );
  }

  Map<String, dynamic> toJson() => {
    'album': album?.toJson(),
    'artists': artists?.map((x) => x.toJson()).toList(),
    'available_markets': availableMarkets?.map((x) => x).toList(),
    'disc_number': discNumber,
    'duration_ms': durationMs,
    'explicit': explicit,
    'external_urls': externalUrls?.toJson(),
    'href': href,
    'id': id,
    'is_playable': isPlayable,
    'restrictions': restrictions?.toJson(),
    'name': name,
    'popularity': popularity,
    'preview_url': previewUrl,
    'track_number': trackNumber,
    'type': type,
    'uri': uri,
    'is_local': isLocal,
  };

  @override
  String toString() {
    return '$name - $album';
  }
}