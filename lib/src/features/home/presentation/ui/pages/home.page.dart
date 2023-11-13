import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spotiflutter/src/features/home/presentation/controller/home.controller.dart';
import 'package:spotiflutter/src/features/home/presentation/ui/widgets/home_section/home_page_icon.widget.dart';
import 'package:spotiflutter/src/features/home/presentation/ui/widgets/home_section/home_section.widget.dart';
import 'package:spotiflutter/src/features/home/presentation/ui/widgets/search_section/search_section.widget.dart';
import 'package:spotiflutter/src/features/preferences/domain/entities/language.enum.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/home';
  final AppLanguage language;

  const HomePage({
    Key? key,
    required this.language,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = GetIt.I.get<HomeController>();
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      controller.setPageIndex(pageController.page?.toInt() ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: pageController,
            children: [
              HomeSection(language: widget.language),
              const SearchSection(),
              Container(),
            ],
          ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: ValueListenableBuilder(
              valueListenable: controller.state,
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HomePageIcon(
                      icon: Icons.home_outlined,
                      currentPage: value.pageIndex,
                      page: 0,
                      onTap: () => navigateTo(0),
                    ),
                    HomePageIcon(
                      icon: Icons.search,
                      currentPage: value.pageIndex,
                      page: 1,
                      onTap: () => navigateTo(1),
                    ),
                    HomePageIcon(
                      icon: Icons.person_outline,
                      currentPage: value.pageIndex,
                      page: 2,
                      onTap: () => navigateTo(2),
                    ),
                  ],
                );
              },
            ),
          ),
        )
      ],
    );
  }

  void navigateTo(int page) {
    controller.setPageIndex(page);
    pageController.jumpToPage(page);
  }
}
