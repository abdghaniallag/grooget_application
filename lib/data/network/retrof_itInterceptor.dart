import 'dart:developer';

import 'package:dio/dio.dart';
import '../../app/functions.dart';
import '../../app/app_preferences.dart';
import '../../app/di.dart';

class ReceivedCookiesInterceptor implements Interceptor {
  AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String language = await _appPreferences.getAppLangague();
    String test =
        options.baseUrl.replaceAll(RegExp('/rest\$'), '/$language/rest');
    log(test);
    options.baseUrl = test;
    String cookie = await _appPreferences.getToken();
    if (cookie.isNotEmpty) {
      options.headers.remove("Cookie");
      options.headers.addAll({"Cookie": "PrestaShop$cookie"});
    }
    return handler.next(options);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) async {
    log(name: 'message', response.data.toString());
    if (response.headers["set-cookie"] != null) {
      await _appPreferences
          .setToken(getCookie(response.headers["set-cookie"].toString()));
    }
    return handler.next(response);
  }
}
