import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'retrof_itInterceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../app/app_preferences.dart';
import '../../app/constant.dart';
import '../../presentation/resources/languge_manager.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String ATHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";
const String COOKIE = "Cookie";

class DioFactoy {
  ReceivedCookiesInterceptor _cookiesInterceptor = ReceivedCookiesInterceptor();
  AppPreferences _appPreferences;
  DioFactoy(this._appPreferences);
  Future<Dio> getDio() async {
    Dio dio = Dio();

    int _timeOut = 2 * 1000;
    String _language = await _appPreferences.getAppLangague();

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      ATHORIZATION: ATHORIZATION,
      DEFAULT_LANGUAGE: LanguageType.ENGLISH.getValue(),
    };
    dio.options = BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: _timeOut,
        receiveTimeout: _timeOut,
        headers: headers);
    dio.interceptors.add(_cookiesInterceptor);

    if (kReleaseMode) {
      print("release mode no logs");
    } else {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseHeader: true));
    }

    return dio;
  }
}
