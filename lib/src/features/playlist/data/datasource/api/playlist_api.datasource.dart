import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/constants/endpoints.dart';
import 'package:spotiflutter/src/core/constants/local_storage_keys.dart';
import 'package:spotiflutter/src/core/drivers/http_client/http_client.dart';
import 'package:spotiflutter/src/core/exceptions/api_error.exception.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/core/storage/local.storage.dart';
import 'package:spotiflutter/src/features/common/data/dto/fetch_result.dto.dart';
import 'package:spotiflutter/src/features/playlist/data/datasource/playlist.datasource.dart';
import 'package:spotiflutter/src/features/playlist/data/dto/playlist.dto.dart';

@Injectable(as: PlaylistDataSource)
class PlaylistApiDataSource implements PlaylistDataSource {
  final HttpClient httpClient;
  final LocalStorage localStorage;

  PlaylistApiDataSource(
    this.httpClient,
    this.localStorage,
  );

  @override
  Future<Either<SpotiflutterException, FetchResultDto<PlaylistDto>>> fetch({
    String? filter,
    int? limit,
    int? offset,
    String? market,
  }) async {
    var token = await localStorage.get(LocalStorageKeys.spotifyAccessToken);
    var params =
        'q=$filter&type=playlist&limit=${limit ?? 20}&offset=${offset ?? 1}';
    if(market != null){
      params += '&market=$market';
    }
    var response = await httpClient.get(
      '${EndPointConstants.instance.search}/?$params',
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200 && response.data != null) {
      var json = jsonDecode(response.data!);
      List<PlaylistDto> playlists = List<PlaylistDto>.from(
        json['playlists']['items']!.map((x) => PlaylistDto.fromJson(x)),
      );
      var result = FetchResultDto<PlaylistDto>(
        payload: playlists,
        isLast: json['playlists']['next'] == null,
      );
      return Right(result);
    } else {
      return Left(
        ApiErrorException(message: 'Error on fetch playlists from Spotify API'),
      );
    }
  }
}
