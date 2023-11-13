import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/spotify_oauth2_client.dart';
import 'package:spotiflutter/src/core/components/button/spotify_button.dart';
import 'package:spotiflutter/src/core/constants/local_storage_keys.dart';
import 'package:spotiflutter/src/core/storage/local.storage.dart';
import 'package:spotiflutter/src/features/authentication/presentation/controller/intro.controller.dart';
import 'package:spotiflutter/src/features/home/presentation/ui/pages/home.page.dart';

import '../widgets/intro_text_content.widget.dart';

class IntroPage extends StatefulWidget {
  static String routeName = '/';

  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final IntroController controller = GetIt.I.get<IntroController>();
  final LocalStorage localStorage = GetIt.I.get<LocalStorage>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      localStorage.get(LocalStorageKeys.spotifyAccessToken).then((token) {
        if (token != null) {
          controller.loadPreferences().then(
                (value) => Navigator.of(context).pushReplacementNamed(
                  HomePage.routeName,
                  arguments: value,
                ),
              );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(
              'assets/images/svg/spotify_logo_white.svg',
              width: MediaQuery.sizeOf(context).width * 0.12,
            ),
            const SizedBox(height: 20),
            const IntroTextContent(),
            const SizedBox(height: 50),
            SpotifyButton(
              onPressed: () async {
                var authenticated = await controller.authenticate();
                var language = await controller.loadPreferences();
                if (authenticated && mounted) {
                  Navigator.of(context).pushNamed(
                    HomePage.routeName,
                    arguments: language,
                  );
                }
              },
              text: 'Continue to login',
            ),
          ],
        ),
      ),
    );
  }
}
