import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spotiflutter/src/features/home/presentation/controller/home_section.controller.dart';
import 'package:spotiflutter/src/features/home/presentation/ui/widgets/home_section/home_section_categories.widget.dart';
import 'package:spotiflutter/src/features/home/presentation/ui/widgets/home_section/home_section_header.widget.dart';
import 'package:spotiflutter/src/features/home/presentation/ui/widgets/home_section/home_section_playlists.widget.dart';
import 'package:spotiflutter/src/features/home/presentation/ui/widgets/home_section/home_section_title.widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spotiflutter/src/features/preferences/domain/entities/language.enum.dart';

class HomeSection extends StatefulWidget {
  final AppLanguage language;

  const HomeSection({
    Key? key,
    required this.language,
  }) : super(key: key);

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> with AutomaticKeepAliveClientMixin {
  final HomeSectionController controller = GetIt.I.get<HomeSectionController>();

  @override
  void initState() {
    super.initState();
    controller.setLanguage(widget.language);
    controller.initPagingController();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeSectionHeader(text: salutation),
              HomeSectionTitle(
                  text: '${AppLocalizations.of(context)?.playlists}'),
              HomeSectionPlaylists(
                pagingController: controller.playlistsPagingController,
              ),
              HomeSectionTitle(
                  text: '${AppLocalizations.of(context)?.categories}'),
              HomeSectionCategories(
                pagingController: controller.categoriesPagingController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String get salutation {
    var hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return AppLocalizations.of(context)?.goodMorning ?? '';
    } else if (hour >= 12 && hour < 18) {
      return AppLocalizations.of(context)?.goodAfternoon ?? '';
    } else {
      return AppLocalizations.of(context)?.goodEvening ?? '';
    }
  }

  @override
  bool get wantKeepAlive => true;
}
