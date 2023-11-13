import 'spotiflutter.exception.dart';

class DatabaseErrorException extends SpotiflutterException {
  DatabaseErrorException({
    required String message,
  }) : super(message);
}
