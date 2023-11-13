import 'package:spotiflutter/src/features/playlist/data/dto/playlist_track_item.dto.dart';
import 'package:spotiflutter/src/features/playlist/domain/entities/playlist_track_item.entity.dart';

class PlaylistTrack {
  final String? href;
  final num? limit;
  final String? next;
  final num? offset;
  final String? previous;
  final num? total;
  final List<PlaylistTrackItem>? items;

  PlaylistTrack({
    this.href,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
    this.items,
  });

  @override
  String toString() {
    return '$href, $limit, $next, $offset, $previous, $total';
  }
}
