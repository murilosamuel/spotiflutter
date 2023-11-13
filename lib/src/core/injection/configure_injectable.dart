import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'configure_injectable.config.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() async {
  GetIt.I.registerFactory<Client>(
    () => http.Client(),
  );

  GetIt.I.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  $initGetIt(getIt);
}
