// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i28;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/album/data/mapper/album.mapper.dart' as _i36;
import '../../features/artist/data/mapper/artist.mapper.dart' as _i22;
import '../../features/authentication/data/facade/authentication_imp.facade.dart'
    as _i21;
import '../../features/authentication/domain/facade/authentication.facade.dart'
    as _i20;
import '../../features/authentication/domain/usecases/perform_authentication.usecase.dart'
    as _i29;
import '../../features/authentication/domain/usecases/perform_authentication_imp.usecase.dart'
    as _i30;
import '../../features/authentication/presentation/controller/intro.controller.dart'
    as _i43;
import '../../features/category/datasource/data/datasource/api/category_api.datasource.dart'
    as _i38;
import '../../features/category/datasource/data/datasource/category_api.datasource.dart'
    as _i37;
import '../../features/category/datasource/data/datasource/category_database.datasource.dart'
    as _i3;
import '../../features/category/datasource/data/datasource/database/category_database.datasource.dart'
    as _i4;
import '../../features/category/datasource/data/mapper/category.mapper.dart'
    as _i23;
import '../../features/category/datasource/data/repository/category_imp.repository.dart'
    as _i40;
import '../../features/category/domain/repository/category.repository.dart'
    as _i39;
import '../../features/category/domain/usecases/fetch_playlists.usecase.dart'
    as _i41;
import '../../features/category/domain/usecases/fetch_playlists_imp.usecase.dart'
    as _i42;
import '../../features/common/data/mapper/external_url.mapper.dart' as _i5;
import '../../features/common/data/mapper/followers.mapper.dart' as _i6;
import '../../features/common/data/mapper/image_content.mapper.dart' as _i8;
import '../../features/common/data/mapper/restrictions.mapper.dart' as _i17;
import '../../features/home/presentation/controller/home.controller.dart'
    as _i7;
import '../../features/home/presentation/controller/home_section.controller.dart'
    as _i53;
import '../../features/home/presentation/controller/search_section.controller.dart'
    as _i58;
import '../../features/playlist/data/datasource/api/playlist_api.datasource.dart'
    as _i32;
import '../../features/playlist/data/datasource/playlist.datasource.dart'
    as _i31;
import '../../features/playlist/data/mapper/owner.mapper.dart' as _i12;
import '../../features/playlist/data/mapper/playlist.mapper.dart' as _i47;
import '../../features/playlist/data/mapper/playlist_track.mapper.dart' as _i46;
import '../../features/playlist/data/mapper/playlist_track_item.mapper.dart'
    as _i45;
import '../../features/playlist/data/repository/playlist_imp.repository.dart'
    as _i49;
import '../../features/playlist/domain/repository/playlist.repository.dart'
    as _i48;
import '../../features/playlist/domain/usecases/fetch_playlists.usecase.dart'
    as _i51;
import '../../features/playlist/domain/usecases/fetch_playlists_imp.usecase.dart'
    as _i52;
import '../../features/preferences/data/datasource/preferences.datasource.dart'
    as _i13;
import '../../features/preferences/data/datasource/preferences_imp.datasource.dart'
    as _i14;
import '../../features/preferences/data/repository/preferences_imp.repository.dart'
    as _i16;
import '../../features/preferences/domain/repository/preferences.repository.dart'
    as _i15;
import '../../features/preferences/domain/usecases/get_preferences.usecase.dart'
    as _i24;
import '../../features/preferences/domain/usecases/get_preferences_imp.usecase.dart'
    as _i25;
import '../../features/preferences/domain/usecases/save_preferences.usecase.dart'
    as _i18;
import '../../features/preferences/domain/usecases/save_preferences_imp.usecase.dart'
    as _i19;
import '../../features/preferences/presentation/controller/preferences.controller.dart'
    as _i33;
import '../../features/search/data/datasource/api/search_content_api.datasource.dart'
    as _i35;
import '../../features/search/data/datasource/search_content.datasource.dart'
    as _i34;
import '../../features/search/data/mapper/search_result.mapper.dart' as _i50;
import '../../features/search/data/repository/search_imp.repository.dart'
    as _i55;
import '../../features/search/domain/repository/search.repository.dart' as _i54;
import '../../features/search/domain/usecases/search_content.usecase.dart'
    as _i56;
import '../../features/search/domain/usecases/search_content_imp.usecase.dart'
    as _i57;
import '../../features/track/data/mapper/track.mapper.dart' as _i44;
import '../drivers/http_client/http_client.dart' as _i26;
import '../drivers/http_client/http_request_client.dart' as _i27;
import '../storage/local.storage.dart' as _i9;
import '../storage/local_imp.storage.dart' as _i10;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.CategoryDatabaseDataSource>(
      () => _i4.CategoryDatabaseDataSourceImp());
  gh.factory<_i5.ExternalUrlsMapper>(() => _i5.ExternalUrlsMapper());
  gh.factory<_i6.FollowersMapper>(() => _i6.FollowersMapper());
  gh.factory<_i7.HomeController>(() => _i7.HomeController());
  gh.factory<_i8.ImageContentMapper>(() => _i8.ImageContentMapper());
  gh.factory<_i9.LocalStorage>(
      () => _i10.LocalStorageImpl(gh<_i11.FlutterSecureStorage>()));
  gh.factory<_i12.OwnerMapper>(() => _i12.OwnerMapper(
        gh<_i5.ExternalUrlsMapper>(),
        gh<_i6.FollowersMapper>(),
      ));
  gh.factory<_i13.PreferencesDataSource>(
      () => _i14.PreferencesDataSourceImp(gh<_i9.LocalStorage>()));
  gh.factory<_i15.PreferencesRepository>(
      () => _i16.PreferencesRepositoryImp(gh<_i13.PreferencesDataSource>()));
  gh.factory<_i17.RestrictionsMapper>(() => _i17.RestrictionsMapper());
  gh.factory<_i18.SavePreferencesUseCase>(
      () => _i19.SavePreferencesUseCaseImp(gh<_i15.PreferencesRepository>()));
  gh.factory<_i20.SpotifyAuthenticationFacade>(
      () => _i21.SpotifyAuthenticationFacadeImp());
  gh.factory<_i22.ArtistMapper>(() => _i22.ArtistMapper(
        gh<_i8.ImageContentMapper>(),
        gh<_i5.ExternalUrlsMapper>(),
        gh<_i6.FollowersMapper>(),
      ));
  gh.factory<_i23.CategoryMapper>(
      () => _i23.CategoryMapper(gh<_i8.ImageContentMapper>()));
  gh.factory<_i24.GetPreferencesUseCase>(
      () => _i25.GetPreferencesUseCaseImp(gh<_i15.PreferencesRepository>()));
  gh.factory<_i26.HttpClient>(() => _i27.HttpRequestClient(
        gh<_i28.Client>(),
        gh<_i9.LocalStorage>(),
      ));
  gh.factory<_i29.PerformAuthenticationUseCase>(() =>
      _i30.PerformAuthenticationUseCaseImp(
          gh<_i20.SpotifyAuthenticationFacade>()));
  gh.factory<_i31.PlaylistDataSource>(() => _i32.PlaylistApiDataSource(
        gh<_i26.HttpClient>(),
        gh<_i9.LocalStorage>(),
      ));
  gh.factory<_i33.PreferencesController>(() => _i33.PreferencesController(
        gh<_i18.SavePreferencesUseCase>(),
        gh<_i24.GetPreferencesUseCase>(),
      ));
  gh.factory<_i34.SearchContentDataSource>(
      () => _i35.SearchContentApiDataSource(
            gh<_i26.HttpClient>(),
            gh<_i9.LocalStorage>(),
          ));
  gh.factory<_i36.AlbumMapper>(() => _i36.AlbumMapper(
        gh<_i22.ArtistMapper>(),
        gh<_i5.ExternalUrlsMapper>(),
        gh<_i8.ImageContentMapper>(),
        gh<_i17.RestrictionsMapper>(),
      ));
  gh.factory<_i37.CategoryApiDataSource>(() => _i38.CategoryApiDataSourceImp(
        gh<_i26.HttpClient>(),
        gh<_i9.LocalStorage>(),
      ));
  gh.factory<_i39.CategoryRepository>(() => _i40.CategoryRepositoryImp(
        gh<_i37.CategoryApiDataSource>(),
        gh<_i3.CategoryDatabaseDataSource>(),
        gh<_i23.CategoryMapper>(),
      ));
  gh.factory<_i41.FetchCategoriesUseCase>(
      () => _i42.FetchCategoriesUseCaseImp(gh<_i39.CategoryRepository>()));
  gh.factory<_i43.IntroController>(() => _i43.IntroController(
        gh<_i29.PerformAuthenticationUseCase>(),
        gh<_i9.LocalStorage>(),
        gh<_i24.GetPreferencesUseCase>(),
      ));
  gh.factory<_i44.TrackMapper>(() => _i44.TrackMapper(
        gh<_i5.ExternalUrlsMapper>(),
        gh<_i17.RestrictionsMapper>(),
        gh<_i22.ArtistMapper>(),
        gh<_i36.AlbumMapper>(),
      ));
  gh.factory<_i45.PlaylistTrackItemMapper>(() => _i45.PlaylistTrackItemMapper(
        gh<_i12.OwnerMapper>(),
        gh<_i44.TrackMapper>(),
      ));
  gh.factory<_i46.PlaylistTrackMapper>(
      () => _i46.PlaylistTrackMapper(gh<_i45.PlaylistTrackItemMapper>()));
  gh.factory<_i47.PlaylistMapper>(() => _i47.PlaylistMapper(
        gh<_i6.FollowersMapper>(),
        gh<_i5.ExternalUrlsMapper>(),
        gh<_i8.ImageContentMapper>(),
        gh<_i46.PlaylistTrackMapper>(),
        gh<_i12.OwnerMapper>(),
      ));
  gh.factory<_i48.PlaylistRepository>(() => _i49.PlaylistRepositoryImp(
        gh<_i31.PlaylistDataSource>(),
        gh<_i47.PlaylistMapper>(),
      ));
  gh.factory<_i50.SearchResultMapper>(() => _i50.SearchResultMapper(
        gh<_i44.TrackMapper>(),
        gh<_i47.PlaylistMapper>(),
        gh<_i36.AlbumMapper>(),
        gh<_i22.ArtistMapper>(),
      ));
  gh.factory<_i51.FetchPlaylistsUseCase>(
      () => _i52.FetchPlaylistsUseCaseImp(gh<_i48.PlaylistRepository>()));
  gh.factory<_i53.HomeSectionController>(() => _i53.HomeSectionController(
        gh<_i51.FetchPlaylistsUseCase>(),
        gh<_i41.FetchCategoriesUseCase>(),
      ));
  gh.factory<_i54.SearchRepository>(() => _i55.SearchRepositoryImp(
        gh<_i34.SearchContentDataSource>(),
        gh<_i50.SearchResultMapper>(),
      ));
  gh.factory<_i56.SearchContentUseCase>(
      () => _i57.SearchContentUseCaseImp(gh<_i54.SearchRepository>()));
  gh.factory<_i58.SearchSectionController>(
      () => _i58.SearchSectionController(gh<_i56.SearchContentUseCase>()));
  return getIt;
}
