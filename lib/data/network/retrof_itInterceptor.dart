import 'package:dio/dio.dart';
import 'package:mvvm_first_c/data/mapper/mapper.dart';
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
    String cookie = await _appPreferences.getToken();
    if (cookie != EMPTY) {
      options.headers.remove("Cookie");
      options.headers.addAll({"Cookie": "PrestaShop" + cookie});
    }
    return handler.next(options);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.headers.value("set-cookie") != null) {
      await _appPreferences
          .setToken(getCookie(response.headers["set-cookie"].toString()));
      String token = await _appPreferences.getToken();
    }

    return handler.next(response);
  }
}
