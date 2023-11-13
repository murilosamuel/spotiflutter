import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/mapper/entity_mapper.dart';
import 'package:spotiflutter/src/features/playlist/data/dto/playlist_track.dto.dart';
import 'package:spotiflutter/src/features/playlist/data/mapper/playlist_track_item.mapper.dart';
import 'package:spotiflutter/src/features/playlist/domain/entities/playlist_track.entity.dart';

@Injectable()
class PlaylistTrackMapper
    implements EntityMapper<PlaylistTrackDto, PlaylistTrack> {
  final PlaylistTrackItemMapper playlistTrackItemMapper;

  PlaylistTrackMapper(this.playlistTrackItemMapper);

  @override
  PlaylistTrack from(PlaylistTrackDto object) {
    return PlaylistTrack(
      href: object.href,
      total: object.total,
      limit: object.limit,
      offset: object.offset,
      items: object.items != null
          ? object.items!.map((e) => playlistTrackItemMapper.from(e)).toList()
          : null,
      next: object.next,
      previous: object.previous,
    );
  }

  @override
  PlaylistTrackDto to(PlaylistTrack object) {
    return PlaylistTrackDto(
      href: object.href,
      total: object.total,
      limit: object.limit,
      offset: object.offset,
      items: object.items != null
          ? object.items!.map((e) => playlistTrackItemMapper.to(e)).toList()
          : null,
      next: object.next,
      previous: object.previous,
    );
  }
}
