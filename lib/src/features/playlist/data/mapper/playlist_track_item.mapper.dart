import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/mapper/entity_mapper.dart';
import 'package:spotiflutter/src/features/playlist/data/dto/playlist_track_item.dto.dart';
import 'package:spotiflutter/src/features/playlist/data/mapper/owner.mapper.dart';
import 'package:spotiflutter/src/features/playlist/domain/entities/playlist_track_item.entity.dart';
import 'package:spotiflutter/src/features/track/data/mapper/track.mapper.dart';

@Injectable()
class PlaylistTrackItemMapper
    implements EntityMapper<PlaylistTrackItemDto, PlaylistTrackItem> {
  final OwnerMapper ownerMapper;
  final TrackMapper trackMapper;

  PlaylistTrackItemMapper(
    this.ownerMapper,
    this.trackMapper,
  );

  @override
  PlaylistTrackItem from(PlaylistTrackItemDto object) {
    return PlaylistTrackItem(
      addedAt: object.addedAt,
      addedBy:
          object.addedBy != null ? ownerMapper.from(object.addedBy!) : null,
      isLocal: object.isLocal,
      track: object.track != null ? trackMapper.from(object.track!) : null,
    );
  }

  @override
  PlaylistTrackItemDto to(PlaylistTrackItem object) {
    return PlaylistTrackItemDto(
      addedAt: object.addedAt,
      addedBy: object.addedBy != null ? ownerMapper.to(object.addedBy!) : null,
      isLocal: object.isLocal,
      track: object.track != null ? trackMapper.to(object.track!) : null,
    );
  }
}
