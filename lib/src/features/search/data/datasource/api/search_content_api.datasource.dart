import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/constants/endpoints.dart';
import 'package:spotiflutter/src/core/constants/local_storage_keys.dart';
import 'package:spotiflutter/src/core/drivers/http_client/http_client.dart';
import 'package:spotiflutter/src/core/exceptions/api_error.exception.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/core/storage/local.storage.dart';
import 'package:spotiflutter/src/features/album/data/dto/album.dto.dart';
import 'package:spotiflutter/src/features/artist/data/dto/artist.dto.dart';
import 'package:spotiflutter/src/features/common/data/dto/fetch_result.dto.dart';
import 'package:spotiflutter/src/features/playlist/data/dto/playlist.dto.dart';
import 'package:spotiflutter/src/features/search/data/datasource/search_content.datasource.dart';
import 'package:spotiflutter/src/features/search/data/dto/search_result.dto.dart';
import 'package:spotiflutter/src/features/track/data/dto/track.dto.dart';

@Injectable(as: SearchContentDataSource)
class SearchContentApiDataSource implements SearchContentDataSource {
  final HttpClient httpClient;
  final LocalStorage localStorage;

  SearchContentApiDataSource(this.httpClient, this.localStorage);

  @override
  Future<Either<SpotiflutterException, FetchResultDto<SearchResultDto>>> fetch(
    String filter,
  ) async {
    var token = await localStorage.get(LocalStorageKeys.spotifyAccessToken);
    var types = 'track,playlist,album,artist';
    var response = await httpClient.get(
      '${EndPointConstants.instance.search}/?q=$filter&type=$types',
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200 && response.data != null) {
      var json = jsonDecode(response.data!);
      List<AlbumDto> albums = List<AlbumDto>.from(
        json['albums']['items']!.map((x) => AlbumDto.fromJson(x)),
      );
      List<TrackDto> tracks = List<TrackDto>.from(
        json['tracks']['items']!.map((x) => TrackDto.fromJson(x)),
      );
      List<PlaylistDto> playlists = List<PlaylistDto>.from(
        json['playlists']['items']!.map((x) => PlaylistDto.fromJson(x)),
      );
      List<ArtistDto> artists = List<ArtistDto>.from(
        json['artists']['items']!.map((x) => ArtistDto.fromJson(x)),
      );
      return Right(
        FetchResultDto<SearchResultDto>(
          payload: [
            SearchResultDto(
              albums: albums,
              playlists: playlists,
              tracks: tracks,
              artists: artists,
            ),
          ],
        ),
      );
    } else {
      return Left(
        ApiErrorException(message: 'Error on searching data from Spotify API'),
      );
    }
  }
}
