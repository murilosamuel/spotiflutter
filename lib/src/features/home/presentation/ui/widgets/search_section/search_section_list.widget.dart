import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:spotiflutter/src/features/album/domain/entities/album.entity.dart';
import 'package:spotiflutter/src/features/artist/domain/entities/artist.entity.dart';
import 'package:spotiflutter/src/features/artist/presentation/pages/artist.page.dart';
import 'package:spotiflutter/src/features/home/presentation/ui/widgets/search_section/search_section_card.widget.dart';
import 'package:spotiflutter/src/features/playlist/domain/entities/playlist.entity.dart';
import 'package:spotiflutter/src/features/track/domain/entities/track.entity.dart';
import 'package:spotiflutter/src/core/extensions/string.extension.dart';

class SearchSectionList extends StatelessWidget {
  final PagingController<int, Object> pagingController;

  const SearchSectionList({
    Key? key,
    required this.pagingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, Object>(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      pagingController: pagingController,
      physics: const BouncingScrollPhysics(),
      builderDelegate: PagedChildBuilderDelegate<Object>(
        itemBuilder: (context, item, index) {
          if (item is Playlist) {
            return SearchSectionCard(
              imageUrl: item.images?.firstOrNull?.url ?? '',
              title: item.name ?? '',
              subtitle: 'Playlist • ${item.owner?.name ?? 'Spotify'}',
            );
          } else if (item is Album) {
            return SearchSectionCard(
              imageUrl: item.images?.firstOrNull?.url ?? '',
              title: item.name ?? '',
              subtitle:
                  'Album • ${item.artists.toString().replaceInitialAndFinalBrackets()}',
            );
          } else if (item is Track) {
            return SearchSectionCard(
              imageUrl: item.album?.images?.firstOrNull?.url ?? '',
              title: item.name ?? '',
              subtitle:
                  'Song • ${item.artists.toString().replaceInitialAndFinalBrackets()}',
            );
          } else if (item is Artist) {
            return SearchSectionCard(
              imageUrl: item.images?.firstOrNull?.url ?? '',
              title: item.name ?? '',
              subtitle: 'Artist • ${item.name}',
              onTap: () {
                Navigator.of(context).pushNamed(
                  ArtistPage.routeName,
                  arguments: item,
                );
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
        noItemsFoundIndicatorBuilder: (context) => const SizedBox.shrink(),
        firstPageErrorIndicatorBuilder: (context) => Container(),
      ),
    );
  }
}
