import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:spotiflutter/src/core/constants/endpoints.dart';
import 'package:spotiflutter/src/core/drivers/http_client/http_client.dart';
import 'package:spotiflutter/src/core/exceptions/api_error.exception.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/features/artist/data/datasource/artist.datasource.dart';
import 'package:spotiflutter/src/features/artist/data/dto/artist.dto.dart';

class ArtistApiDataSource implements ArtistDataSource {
  final HttpClient _httpClient;

  ArtistApiDataSource(this._httpClient);

  @override
  Future<Either<SpotiflutterException, ArtistDto>> find(String id) async {
    var response = await _httpClient.get(
      '${EndPointConstants.instance.artists}/$id',
    );

    if (response.statusCode == 200 && response.data != null) {
      var json = jsonDecode(response.data!);
      return Right(ArtistDto.fromJson(json));
    } else {
      return Left(
        ApiErrorException(message: 'Error on fetch playlists from Spotify API'),
      );
    }
  }
}
