import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pp;
import 'package:spotiflutter/src/core/injection/configure_injectable.dart';
import 'package:spotiflutter/src/core/l10n/l10n.dart';
import 'package:spotiflutter/src/features/artist/domain/entities/artist.entity.dart';
import 'package:spotiflutter/src/features/artist/presentation/pages/artist.page.dart';
import 'package:spotiflutter/src/features/authentication/presentation/ui/pages/intro.page.dart';
import 'package:spotiflutter/src/features/home/presentation/ui/pages/home.page.dart';
import 'package:spotiflutter/src/core/theme/app.theme.dart';
import 'package:spotiflutter/src/features/preferences/domain/entities/language.enum.dart';
import 'package:spotiflutter/src/features/preferences/presentation/ui/pages/preferences.page.dart';

import 'flavors.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();
  await initDatabase();
  await loadEnvironmentVariables();

  runApp(const SpotiFlutterApp());
}

Future<void> initDatabase() async {
  var appDocumentDirectory = await pp.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
}

Future<void> loadEnvironmentVariables() async {
  await dotenv.load(fileName: ".env");
}

class SpotiFlutterApp extends StatefulWidget {
  const SpotiFlutterApp({super.key});

  @override
  State<SpotiFlutterApp> createState() => _SpotiFlutterAppState();

  static _SpotiFlutterAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_SpotiFlutterAppState>();
}

class _SpotiFlutterAppState extends State<SpotiFlutterApp> {
  Locale _locale = const Locale('en');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: F.title,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
      color: AppTheme.colors.primary,
      initialRoute: IntroPage.routeName,
      supportedLocales: L10n.all,
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routes: {
        IntroPage.routeName: (context) => const IntroPage(),
        HomePage.routeName: (context) {
          bool isLanguage =
              ModalRoute.of(context)!.settings.arguments is AppLanguage;
          if (!isLanguage) {
            throw Exception('invalid language parameter');
          }
          var language =
              ModalRoute.of(context)!.settings.arguments as AppLanguage;
          return HomePage(
            language: language,
          );
        },
        PreferencesPage.routeName: (context) => const PreferencesPage(),
        ArtistPage.routeName: (context) {
          bool isArtist = ModalRoute.of(context)!.settings.arguments is Artist;
          if (!isArtist) {
            throw Exception('invalid artist parameter');
          }
          var artist = ModalRoute.of(context)!.settings.arguments as Artist;
          return ArtistPage(
            artist: artist,
          );
        }
      },
    );
  }
}
