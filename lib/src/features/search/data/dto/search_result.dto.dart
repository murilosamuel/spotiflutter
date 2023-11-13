import 'package:spotiflutter/src/features/album/data/dto/album.dto.dart';
import 'package:spotiflutter/src/features/artist/data/dto/artist.dto.dart';
import 'package:spotiflutter/src/features/playlist/data/dto/playlist.dto.dart';
import 'package:spotiflutter/src/features/track/data/dto/track.dto.dart';

class SearchResultDto {
  final List<PlaylistDto>? playlists;
  final List<AlbumDto>? albums;
  final List<TrackDto>? tracks;
  final List<ArtistDto>? artists;

  SearchResultDto({
    this.playlists,
    this.albums,
    this.tracks,
    this.artists,
  });
}
