import 'package:spotiflutter/src/features/album/domain/entities/album.entity.dart';
import 'package:spotiflutter/src/features/artist/domain/entities/artist.entity.dart';
import 'package:spotiflutter/src/features/common/domain/entities/external_urls.entity.dart';
import 'package:spotiflutter/src/features/common/domain/entities/restrictions.entity.dart';

class Track {
  final Album? album;
  final List<Artist>? artists;
  final List<String>? availableMarkets;
  final num? discNumber;
  final num? durationMs;
  final bool? explicit;
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final bool? isPlayable;
  final Restrictions? restrictions;
  final String? name;
  final num? popularity;
  final String? previewUrl;
  final num? trackNumber;
  final String? type;
  final String? uri;
  final bool? isLocal;

  Track({
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

  @override
  String toString() {
    return '$name - $album';
  }
}