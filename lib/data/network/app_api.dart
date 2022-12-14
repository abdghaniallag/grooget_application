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

  @GET('/cart')
  Future<UserCartResponse> updateCart({
    @Query("update") String? update,
    @Query("id_product") int? id_product,
    @Query("id_product_attribute") int? id_product_attribute,
    @Query("op") String? op,
    @Query("action") String? action,
    @Query("qty") int? qty,
    @Query("delete") int? delete,
  });

  @GET('/categoryProducts')
  Future<CategoryListResponse> getCategories(
    @Query("id_category") String productId, {
    @Query("page") int page = 0,
    @Query("order") String? order  ,
    @Query("q") String? q ,
    @Query("resultsPerPage") int resultsPerPage = 1,
    @Query("with_category_tree") int with_category_tree = 0,
  });

  @POST('/register')
  Future<AuthenticationRespons> register( 
    @Field("email") String email,
    @Field("password") String password,
    @Field("firstName") String firstName,
    @Field("lastName") String lastName,
  ); 
  @GET('/productSearch')
  Future<ProductSearchListResponse> getProductSearchList(@Query("s") String s,
      {@Query("resultsPerPage") String resultsPerPage = "10"});
}
