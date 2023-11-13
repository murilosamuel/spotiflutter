import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/mapper/entity_mapper.dart';
import 'package:spotiflutter/src/features/common/data/mapper/external_url.mapper.dart';
import 'package:spotiflutter/src/features/common/data/mapper/followers.mapper.dart';
import 'package:spotiflutter/src/features/common/data/mapper/image_content.mapper.dart';
import 'package:spotiflutter/src/features/playlist/data/dto/playlist.dto.dart';
import 'package:spotiflutter/src/features/playlist/data/mapper/owner.mapper.dart';
import 'package:spotiflutter/src/features/playlist/data/mapper/playlist_track.mapper.dart';
import 'package:spotiflutter/src/features/playlist/domain/entities/playlist.entity.dart';

@Injectable()
class PlaylistMapper implements EntityMapper<PlaylistDto, Playlist> {
  final FollowersMapper followersMapper;
  final ExternalUrlsMapper externalUrlsMapper;
  final ImageContentMapper imageContentMapper;
  final PlaylistTrackMapper playlistTrackMapper;
  final OwnerMapper ownerMapper;

  PlaylistMapper(
    this.followersMapper,
    this.externalUrlsMapper,
    this.imageContentMapper,
    this.playlistTrackMapper,
    this.ownerMapper,
  );

  @override
  Playlist from(PlaylistDto object) {
    return Playlist(
      href: object.href,
      followers: object.followers != null
          ? followersMapper.from(object.followers!)
          : null,
      uri: object.uri,
      externalUrls: object.externalUrls != null
          ? externalUrlsMapper.from(object.externalUrls!)
          : null,
      type: object.type,
      name: object.name,
      id: object.id,
      images: object.images != null
          ? object.images!.map((e) => imageContentMapper.from(e)).toList()
          : null,
      tracks: object.tracks != null
          ? playlistTrackMapper.from(object.tracks!)
          : null,
      description: object.description,
      collaborative: object.collaborative,
      owner: object.owner != null ? ownerMapper.from(object.owner!) : null,
      public: object.public,
      snapshotId: object.snapshotId,
    );
  }

  @override
  PlaylistDto to(Playlist object) {
    return PlaylistDto(
      href: object.href,
      followers: object.followers != null
          ? followersMapper.to(object.followers!)
          : null,
      uri: object.uri,
      externalUrls: object.externalUrls != null
          ? externalUrlsMapper.to(object.externalUrls!)
          : null,
      type: object.type,
      name: object.name,
      id: object.id,
      images: object.images != null
          ? object.images!.map((e) => imageContentMapper.to(e)).toList()
          : null,
      tracks:
          object.tracks != null ? playlistTrackMapper.to(object.tracks!) : null,
      description: object.description,
      collaborative: object.collaborative,
      owner: object.owner != null ? ownerMapper.to(object.owner!) : null,
      public: object.public,
      snapshotId: object.snapshotId,
    );
  }
}
