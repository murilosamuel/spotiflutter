import 'package:spotiflutter/src/features/artist/data/dto/artist.dto.dart';
import 'package:spotiflutter/src/features/common/data/dto/external_urls.dto.dart';
import 'package:spotiflutter/src/features/common/data/dto/image_content.dto.dart';
import 'package:spotiflutter/src/features/common/data/dto/restrictions.dto.dart';

class AlbumDto {
  final String? albumType;
  final num? totalTracks;
  final List<String>? availableMarkets;
  final ExternalUrlsDto? externalUrls;
  final String? href;
  final String? id;
  final List<ImageContentDto>? images;
  final String? name;
  final String? releaseDate;
  final String? releaseDatePrecision;
  final RestrictionsDto? restrictions;
  final String? type;
  final String? uri;
  final List<ArtistDto>? artists;

  AlbumDto({
    this.albumType,
    this.totalTracks,
    this.availableMarkets,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.releaseDate,
    this.releaseDatePrecision,
    this.restrictions,
    this.type,
    this.uri,
    this.artists,
  });

  factory AlbumDto.fromJson(Map<String, dynamic> json) {
    return AlbumDto(
      albumType: json['album_type'],
      totalTracks: json['total_tracks'],
      availableMarkets: json['available_markets'] == null
          ? []
          : List<String>.from(json['available_markets']!.map((x) => x)),
      externalUrls: json['external_urls'] == null
          ? null
          : ExternalUrlsDto.fromJson(json['external_urls']),
      href: json['href'],
      id: json['id'],
      images: json['images'] == null
          ? []
          : List<ImageContentDto>.from(json['images']!.map((x) => ImageContentDto.fromJson(x))),
      name: json['name'],
      releaseDate: json['release_date'],
      releaseDatePrecision: json['release_date_precision'],
      restrictions: json['restrictions'] == null
          ? null
          : RestrictionsDto.fromJson(json['restrictions']),
      type: json['type'],
      uri: json['uri'],
      artists: json['artists'] == null
          ? []
          : List<ArtistDto>.from(json['artists']!.map((x) => ArtistDto.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    'album_type': albumType,
    'total_tracks': totalTracks,
    'available_markets': availableMarkets?.map((x) => x).toList(),
    'external_urls': externalUrls?.toJson(),
    'href': href,
    'id': id,
    'images': images?.map((x) => x.toJson()).toList(),
    'name': name,
    'release_date': releaseDate,
    'release_date_precision': releaseDatePrecision,
    'restrictions': restrictions?.toJson(),
    'type': type,
    'uri': uri,
    'artists': artists?.map((x) => x.toJson()).toList(),
  };

  @override
  String toString() {
    return '$name - $releaseDate';
  }
}