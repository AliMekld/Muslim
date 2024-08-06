import 'package:dartz/dartz.dart';
import 'package:muslim/core/api/error_helper.dart';
import 'package:muslim/core/api/generic_requests.dart';
import 'package:muslim/core/api/request_methods.dart';
import 'package:muslim/models/surah_model.dart';
import 'package:muslim/utilites/api_end_points.dart';

class SplashDataHandler {
  static Future<Either<Failure, List<SurahModel>>> getAllSurahs() async {
    try {
      List<SurahModel> response = await GenericRequest<SurahModel>(
        fromMap:(_)=> SurahModel.fromJson(_),
        method: RequestMethods.get(ApiEndPoints.allSurahs),
      ).getList();
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
