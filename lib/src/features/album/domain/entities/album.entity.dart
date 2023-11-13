import 'package:spotiflutter/src/features/artist/domain/entities/artist.entity.dart';
import 'package:spotiflutter/src/features/common/domain/entities/external_urls.entity.dart';
import 'package:spotiflutter/src/features/common/domain/entities/image_content.entity.dart';
import 'package:spotiflutter/src/features/common/domain/entities/restrictions.entity.dart';

class Album {
  final String? albumType;
  final num? totalTracks;
  final List<String>? availableMarkets;
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final List<ImageContent>? images;
  final String? name;
  final String? releaseDate;
  final String? releaseDatePrecision;
  final Restrictions? restrictions;
  final String? type;
  final String? uri;
  final List<Artist>? artists;

  Album({
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

  @override
  String toString() {
    return '$name - $releaseDate';
  }
}
