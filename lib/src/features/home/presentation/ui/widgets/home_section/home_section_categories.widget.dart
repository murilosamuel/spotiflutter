import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:spotiflutter/src/features/category/domain/entities/category.entity.dart';
import 'package:spotiflutter/src/features/home/presentation/ui/widgets/home_section/category_item_card.widget.dart';

class HomeSectionCategories extends StatelessWidget {
  final PagingController<int, Category> pagingController;

  const HomeSectionCategories({
    Key? key,
    required this.pagingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context).width * 0.45;
    return CustomScrollView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      slivers: [
        PagedSliverGrid<int, Category>(
          pagingController: pagingController,
          builderDelegate: PagedChildBuilderDelegate<Category>(
            itemBuilder: (context, item, index) {
              return CategoryItemCard(
                category: item,
                imageSize: size,
              );
            },
            noItemsFoundIndicatorBuilder: (context) => Container(),
            firstPageErrorIndicatorBuilder: (context) => Container(),
          ),
          addAutomaticKeepAlives: true,
          shrinkWrapFirstPageIndicators: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 10 / 10,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
          ),
        ),
      ],
    );
  }
}
