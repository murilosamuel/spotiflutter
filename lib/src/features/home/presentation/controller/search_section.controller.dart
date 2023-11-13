import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/utils/delayer.util.dart';
import 'package:spotiflutter/src/features/search/domain/entities/search_result.entity.dart';
import 'package:spotiflutter/src/features/search/domain/usecases/search_content.usecase.dart';

@Injectable()
class SearchSectionController {
  final SearchContentUseCase searchContentUseCase;

  SearchSectionController(this.searchContentUseCase);

  final _delayer = Delayer(milliseconds: 500);

  String? searchText;

  List<Object> contentList = [];

  PagingController<int, Object> contentPagingController =
      PagingController(firstPageKey: 0);

  void initPagingController() {
    contentPagingController.removePageRequestListener(searchListener);
    contentPagingController.addPageRequestListener(searchListener);
  }

  void searchListener(pageKey) {
    Future.sync(() => fetchContent(pageKey));
  }

  void setSearchText(String value) {
    searchText = value;
    _delayer.run(() {
      contentList.clear();
      contentPagingController.itemList?.clear();
      contentPagingController.refresh();
    });
  }

  Future fetchContent(int page) async {
    var result = await searchContentUseCase(searchText ?? 'top');
    result.fold(
      (exception) => contentPagingController.error = exception,
      (content) {
        List<Object> contentResult = [];
        for (SearchResult result in content.payload ?? []) {
          contentList.addAll(result.shuffleResults);
          contentResult.addAll(result.shuffleResults);
        }
        if (content.isLast) {
          contentPagingController.appendLastPage(contentResult);
        } else {
          contentPagingController.appendPage(contentResult, page + 1);
        }
      },
    );
  }
}
