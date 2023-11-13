import 'package:spotiflutter/src/features/playlist/data/dto/owner.dto.dart';
import 'package:spotiflutter/src/features/track/data/dto/track.dto.dart';

class PlaylistTrackItemDto {
  final String? addedAt;
  final OwnerDto? addedBy;
  final bool? isLocal;
  final TrackDto? track;

  PlaylistTrackItemDto({
    this.addedAt,
    this.addedBy,
    this.isLocal,
    this.track,
  });

  factory PlaylistTrackItemDto.fromJson(Map<String, dynamic> json) {
    return PlaylistTrackItemDto(
      addedAt: json['added_at'],
      addedBy:
      json['added_by'] == null ? null : OwnerDto.fromJson(json['added_by']),
      isLocal: json['is_local'],
      track: json['track'] == null ? null : TrackDto.fromJson(json['track']),
    );
  }

  Map<String, dynamic> toJson() => {
    'added_at': addedAt,
    'added_by': addedBy?.toJson(),
    'is_local': isLocal,
    'track': track?.toJson(),
  };

  @override
  String toString() {
    return '$addedAt, $addedBy, $isLocal, $track';
  }
}
