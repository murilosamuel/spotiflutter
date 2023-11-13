import 'package:dartz/dartz.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/features/artist/data/dto/artist.dto.dart';

abstract class ArtistDataSource {
  Future<Either<SpotiflutterException, ArtistDto>> find(String id);
}