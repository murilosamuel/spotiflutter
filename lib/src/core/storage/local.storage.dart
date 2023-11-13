abstract class LocalStorage {
  Future put<T>(String key, String value);

  Future<T?> get<T>(String key);

  Future delete(String key);

  Future clear();
}
