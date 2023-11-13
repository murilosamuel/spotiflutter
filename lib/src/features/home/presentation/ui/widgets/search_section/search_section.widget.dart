import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spotiflutter/src/core/components/text_field/spotift_text_field.dart';
import 'package:spotiflutter/src/features/home/presentation/controller/home_section.controller.dart';
import 'package:spotiflutter/src/features/home/presentation/controller/search_section.controller.dart';
import 'package:spotiflutter/src/features/home/presentation/ui/widgets/home_section/home_section_categories.widget.dart';
import 'package:spotiflutter/src/features/home/presentation/ui/widgets/home_section/home_section_header.widget.dart';
import 'package:spotiflutter/src/features/home/presentation/ui/widgets/home_section/home_section_playlists.widget.dart';
import 'package:spotiflutter/src/features/home/presentation/ui/widgets/home_section/home_section_title.widget.dart';
import 'package:spotiflutter/src/features/home/presentation/ui/widgets/search_section/search_section_list.widget.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({Key? key}) : super(key: key);

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection>
    with AutomaticKeepAliveClientMixin {
  final SearchSectionController controller =
      GetIt.I.get<SearchSectionController>();

  @override
  void initState() {
    super.initState();
    controller.initPagingController();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: SpotifyTextField(
                onChanged: (text) {
                  controller.setSearchText(text);
                },
              ),
            ),
            Expanded(
              child: SearchSectionList(
                pagingController: controller.contentPagingController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
