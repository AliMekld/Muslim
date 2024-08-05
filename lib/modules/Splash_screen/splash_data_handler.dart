import 'package:dartz/dartz.dart';

class SplashDataHandler {
  Future<Either<String, List>> getAll() async {
    try {
      return Right([]);
    } catch (e) {
      return Left("");
    }
  }
}
