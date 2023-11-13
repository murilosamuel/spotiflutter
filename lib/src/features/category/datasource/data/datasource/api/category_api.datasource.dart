import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/constants/endpoints.dart';
import 'package:spotiflutter/src/core/constants/local_storage_keys.dart';
import 'package:spotiflutter/src/core/drivers/http_client/http_client.dart';
import 'package:spotiflutter/src/core/exceptions/api_error.exception.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/core/storage/local.storage.dart';
import 'package:spotiflutter/src/features/category/datasource/data/datasource/category_api.datasource.dart';
import 'package:spotiflutter/src/features/category/datasource/data/dto/category.dto.dart';
import 'package:spotiflutter/src/features/common/data/dto/fetch_result.dto.dart';

@Injectable(as: CategoryApiDataSource)
class CategoryApiDataSourceImp implements CategoryApiDataSource {
  final HttpClient httpClient;
  final LocalStorage localStorage;

  CategoryApiDataSourceImp(
    this.httpClient,
    this.localStorage,
  );

  @override
  Future<Either<SpotiflutterException, FetchResultDto<CategoryDto>>> fetch({
    String? filter,
    int? limit,
    int? offset,
    String? country,
  }) async {
    var token = await localStorage.get(LocalStorageKeys.spotifyAccessToken);

    var params = 'limit=${limit ?? 20}&offset=${offset ?? 1}';
    if (country != null) {
      params += '&country=$country';
    }
    var response = await httpClient.get(
      '${EndPointConstants.instance.browseCategories}?$params',
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200 && response.data != null) {
      var json = jsonDecode(response.data!);
      List<CategoryDto> categories = List<CategoryDto>.from(
        json['categories']['items']!.map((x) => CategoryDto.fromJson(x)),
      );
      var result = FetchResultDto<CategoryDto>(
        payload: categories,
        isLast: json['categories']['next'] == null,
      );
      return Right(result);
    } else {
      return Left(
        ApiErrorException(
            message: 'Error on fetch categories from Spotify API'),
      );
    }
  }
}
