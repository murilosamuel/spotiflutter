import 'spotiflutter.exception.dart';

class ApiErrorException extends SpotiflutterException {
  ApiErrorException({
    String message = 'Erro ao comunicar com API',
  }) : super(message);
}
