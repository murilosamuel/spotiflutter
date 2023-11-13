import 'package:spotiflutter/src/features/playlist/data/dto/owner.dto.dart';
import 'package:spotiflutter/src/features/playlist/domain/entities/owner.entity.dart';
import 'package:spotiflutter/src/features/track/data/dto/track.dto.dart';
import 'package:spotiflutter/src/features/track/domain/entities/track.entity.dart';

class PlaylistTrackItem {
  final String? addedAt;
  final Owner? addedBy;
  final bool? isLocal;
  final Track? track;

  PlaylistTrackItem({
    this.addedAt,
    this.addedBy,
    this.isLocal,
    this.track,
  });

  @override
  String toString() {
    return '$addedAt, $addedBy, $isLocal, $track';
  }
}
