
import 'package:spotiflutter/src/features/common/domain/entities/external_urls.entity.dart';
import 'package:spotiflutter/src/features/common/domain/entities/followers.entity.dart';
import 'package:spotiflutter/src/features/common/domain/entities/image_content.entity.dart';
import 'package:spotiflutter/src/features/playlist/domain/entities/owner.entity.dart';
import 'package:spotiflutter/src/features/playlist/domain/entities/playlist_track.entity.dart';

class Playlist {
  final bool? collaborative;
  final String? description;
  final ExternalUrls? externalUrls;
  final Followers? followers;
  final String? href;
  final String? id;
  final List<ImageContent>? images;
  final String? name;
  final Owner? owner;
  final bool? public;
  final String? snapshotId;
  final PlaylistTrack? tracks;
  final String? type;
  final String? uri;

  Playlist({
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

  @override
  String toString() {
    return description ?? '';
  }
}
