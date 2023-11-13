import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spotiflutter/main.dart';
import 'package:spotiflutter/src/core/components/button/spotify_button.dart';
import 'package:spotiflutter/src/core/theme/app.theme.dart';
import 'package:spotiflutter/src/features/home/presentation/ui/pages/home.page.dart';
import 'package:spotiflutter/src/features/preferences/domain/entities/language.enum.dart';
import 'package:spotiflutter/src/features/preferences/presentation/controller/preferences.controller.dart';
import 'package:spotiflutter/src/features/preferences/presentation/ui/widgets/language_button.widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PreferencesPage extends StatefulWidget {
  static String routeName = '/preferences';

  const PreferencesPage({Key? key}) : super(key: key);

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  final controller = GetIt.I.get<PreferencesController>();

  @override
  void initState() {
    controller.loadPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.colors.black,
        title: const Text('Preferences'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ValueListenableBuilder(
            valueListenable: controller.language,
            builder:
                (BuildContext context, AppLanguage? value, Widget? child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(),
                  ...AppLanguage.values
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: LanguageButton(
                            language: getText(e),
                            abbreviation: e.abbreviation,
                            selected: value == e,
                            onTap: () {
                              controller.setLanguage(e);
                              SpotiFlutterApp.of(context)?.setLocale(e.locale);
                            },
                          ),
                        ),
                      )
                      .toList(),
                  const Spacer(),
                  SpotifyButton(
                    onPressed: () async {
                      await controller.savePreferences();
                      if (mounted) {
                        Navigator.of(context).pushReplacementNamed(
                          HomePage.routeName,
                          arguments: controller.language.value,
                        );
                      }
                    },
                    text: 'Save',
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  String getText(AppLanguage languages) {
    if (languages == AppLanguage.spanish) {
      return '${AppLocalizations.of(context)?.spanish}';
    } else if (languages == AppLanguage.english) {
      return '${AppLocalizations.of(context)?.english}';
    } else if (languages == AppLanguage.portuguese) {
      return '${AppLocalizations.of(context)?.portuguese}';
    } else {
      return '';
    }
  }
}
