import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'local.storage.dart';

@Injectable(as: LocalStorage)
class LocalStorageImpl implements LocalStorage {
  final FlutterSecureStorage storage;

  LocalStorageImpl(this.storage);

  @override
  Future<T?> get<T>(String key) {
    return Future.value(storage.read(key: key) as T);
  }

  @override
  Future put<T>(String key, String value) async {
    return await storage.write(key: key, value: value);
  }

  @override
  Future delete(String key) async {
    return await storage.delete(key: key);
  }

  @override
  Future clear() async {
    await storage.deleteAll();
    return;
  }
}
