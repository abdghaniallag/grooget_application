import 'dart:developer';

import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../../app/constant.dart';
import '../responses/responses.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
  @POST('/login')
  Future<AuthenticationRespons> login(
    @Field("email") String email,
    @Field("password") String password,
  );
  @POST('/costumers/forgotpassword')
  Future<ForgotPasswordResponse> forgotPassword(
    @Field("email") String email,
  );
  @GET('/home')
  Future<HomeResponse> getHome();
  @POST('/costumers/register')
  Future<AuthenticationRespons> register(
    @Field("country_mobile_code") String countryMobileCode,
    @Field("user_name") String userName,
    @Field("email") String email,
    @Field("password") String password,
    @Field("mobile_number") String mobile_number,
    @Field("profile_picture") String profilePicture,
  );
}
