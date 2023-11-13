import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:spotiflutter/src/features/home/presentation/ui/widgets/home_section/playlist_item_card.widget.dart';
import 'package:spotiflutter/src/features/playlist/domain/entities/playlist.entity.dart';

class HomeSectionPlaylists extends StatelessWidget {
  final PagingController<int, Playlist> pagingController;

  const HomeSectionPlaylists({
    Key? key,
    required this.pagingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cardSize = MediaQuery.sizeOf(context).width * 0.35;
    var cardHeight = MediaQuery.sizeOf(context).width * 0.55;
    return SizedBox(
      height: cardHeight,
      child: PagedListView<int, Playlist>(
        scrollDirection: Axis.horizontal,
        pagingController: pagingController,
        physics: const BouncingScrollPhysics(),
        builderDelegate: PagedChildBuilderDelegate<Playlist>(
          itemBuilder: (context, item, index) {
            return Padding(
              padding: EdgeInsets.only(
                right: 10,
                left: index == 0 ? 10 : 0,
              ),
              child: SizedBox(
                width: cardSize,
                child: PlaylistItemCard(
                  imageSize: cardSize,
                  playlist: item,
                ),
              ),
            );
          },
          noItemsFoundIndicatorBuilder: (context) => Container(),
          firstPageErrorIndicatorBuilder: (context) => Container(),
          newPageErrorIndicatorBuilder: (context) => Container(),
          noMoreItemsIndicatorBuilder:  (context) => Container(),
        ),
      ),
    );
  }
}
