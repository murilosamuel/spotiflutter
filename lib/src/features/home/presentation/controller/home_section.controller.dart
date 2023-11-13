import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/features/category/domain/entities/category.entity.dart';
import 'package:spotiflutter/src/features/category/domain/usecases/fetch_playlists.usecase.dart';
import 'package:spotiflutter/src/features/playlist/domain/entities/playlist.entity.dart';
import 'package:spotiflutter/src/features/playlist/domain/usecases/fetch_playlists.usecase.dart';
import 'package:spotiflutter/src/features/preferences/domain/entities/language.enum.dart';

@Injectable()
class HomeSectionController {
  final FetchPlaylistsUseCase fetchPlaylistsUseCase;
  final FetchCategoriesUseCase fetchCategoriesUseCase;
  final int limitOfPlaylists = 20;
  final int limitOfCategories = 20;

  HomeSectionController(
    this.fetchPlaylistsUseCase,
    this.fetchCategoriesUseCase,
  );

  PagingController<int, Category> categoriesPagingController =
      PagingController(firstPageKey: 0);

  PagingController<int, Playlist> playlistsPagingController =
      PagingController(firstPageKey: 0);

  AppLanguage? language;

  void setLanguage(AppLanguage? value) => language = value;

  void initPagingController() {
    playlistsPagingController.removePageRequestListener(playlistListener);
    playlistsPagingController.addPageRequestListener(playlistListener);

    categoriesPagingController.removePageRequestListener(categoryListener);
    categoriesPagingController.addPageRequestListener(categoryListener);
  }

  void playlistListener(pageKey) {
    fetchPlaylists(pageKey);
  }

  void categoryListener(pageKey) {
    fetchCategories(pageKey);
  }

  Future fetchPlaylists(int page) async {
    var result = await fetchPlaylistsUseCase(
      filter: 'top',
      limit: limitOfPlaylists,
      offset: (page * limitOfPlaylists),
      market: language?.market,
    );
    result.fold(
      (exception) => playlistsPagingController.error = exception,
      (content) {
        var playlists = content.payload ?? [];
        if (content.isLast) {
          playlistsPagingController.appendLastPage(playlists);
        } else {
          playlistsPagingController.appendPage(playlists, page + 1);
        }
      },
    );
  }

  Future fetchCategories(int page) async {
    var result = await fetchCategoriesUseCase(
      limit: limitOfCategories,
      offset: (page * limitOfCategories),
      country: language?.market,
    );
    result.fold(
      (exception) => categoriesPagingController.error = exception,
      (content) {
        var categories = content.payload ?? [];
        if (content.isLast) {
          categoriesPagingController.appendLastPage(categories);
        } else {
          categoriesPagingController.appendPage(categories, page + 1);
        }
      },
    );
  }
}
