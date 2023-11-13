import 'dart:math';

import 'package:spotiflutter/src/features/album/domain/entities/album.entity.dart';
import 'package:spotiflutter/src/features/artist/domain/entities/artist.entity.dart';
import 'package:spotiflutter/src/features/playlist/domain/entities/playlist.entity.dart';
import 'package:spotiflutter/src/features/track/domain/entities/track.entity.dart';

class SearchResult {
  final List<Playlist>? playlists;
  final List<Album>? albums;
  final List<Track>? tracks;
  final List<Artist>? artists;

  SearchResult({
    this.playlists,
    this.albums,
    this.tracks,
    this.artists,
  });

  List<Object> get shuffleResults {
    List<Object> mergedItems = [
      ...?playlists,
      ...?albums,
      ...?tracks,
      ...?artists,
    ]..shuffle(Random());
    return mergedItems;
  }

  void merge(SearchResult result) {
    playlists?.addAll(result.playlists ?? []);
    albums?.addAll(result.albums ?? []);
    tracks?.addAll(result.tracks ?? []);
    artists?.addAll(result.artists ?? []);
  }
}
