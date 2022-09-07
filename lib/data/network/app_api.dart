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
  @GET('/accountInfo')
  Future<AcountInformationResponse> getAcountInformaiton();
  @POST('/costumers/forgotpassword')
  Future<ForgotPasswordResponse> forgotPassword(
    @Field("email") String email,
  );

  @GET('/productdetail')
  Future<ProductInformationResponse> getProductInformation(
    @Query("product_id") String productId,
  );

  @GET('/categoryProducts')
  Future<CategoryListResponse> getCategories(
    @Query("id_category") String productId, {
    @Query("page") int page = 0,
    @Query("resultsPerPage") int resultsPerPage = 1,
    @Query("with_category_tree") bool with_category_tree = false,
  });

  @POST('/costumers/register')
  Future<AuthenticationRespons> register(
    @Field("country_mobile_code") String countryMobileCode,
    @Field("user_name") String userName,
    @Field("email") String email,
    @Field("password") String password,
    @Field("mobile_number") String mobile_number,
    @Field("profile_picture") String profilePicture,
  );
//TODO
  @GET('/productSearch')
  Future<ProductSearchListResponse> getProductSearchList(@Query("s") String s,
      {@Query("resultsPerPage") String resultsPerPage = "10"});
}
