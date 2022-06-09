import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quranorginapp/components/url_adaptive.dart';
import 'package:quranorginapp/models/quran_date.dart';

class QuransService {
  static Future getQurans() async {
    Response res = await Dio().get(ipAdress3,
        options: Options(
          headers: {"Authorization": "Bearer ${GetStorage().read('token')}"},
        ));
        QuranDate quranDate = QuranDate.fromJson(res.data);
        return quranDate;
  }
}
