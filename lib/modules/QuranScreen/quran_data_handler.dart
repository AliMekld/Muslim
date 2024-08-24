
import 'package:dartz/dartz.dart';

import '../../core/api/generic_request.dart';
import '../../core/api/request_methods.dart';
import '../../models/surah_model.dart';
import '../../utilites/api_end_points.dart';

class QuranDataHandler {
  static Future<Either<Exception, List<SurahModel>>> getAllSurahs() async {
    try {
      List<SurahModel> response = await GenericRequest<SurahModel>(
        method: RequestMethods.get(url:  ApiEndPoints.allSurahs),
        fromJson: (_) => SurahModel.fromJson(_),
      ).getList();
      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
