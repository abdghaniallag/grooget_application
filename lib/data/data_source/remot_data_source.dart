import '../../data/network/app_api.dart';
import '../../data/request/request.dart';
import '../../data/responses/responses.dart'; 

abstract class RemotDataSource {
  Future<AuthenticationRespons> login(LoginRequest loginRequest);
  Future<ForgotPasswordResponse> forgotPassword(String email);
  Future<AcountInformationResponse> getAcountInformation();
  Future<AuthenticationRespons> register(RegisterRequest registerRequest);

  Future<ProductInformationResponse> getProductInformation(String id);
  Future<ProductSearchListResponse> getProductSearchList(String s,
      {String resultsPerPage = "10"});

  Future<CategoryListResponse> getCategoryList(String productId,
      {int page = 0, int resultsPerPage = 1, int with_category_tree = 0});

  Future<UserCartResponse> updatCart({
    String? update,
    int? id_product,
    int? id_product_attribute,
    String? op,
    String? action,
    int? qty,
    int? delete,
  });
}

class RemotDataSourceImpilenter implements RemotDataSource {
  AppServiceClient _appServiceClient;
  RemotDataSourceImpilenter(this._appServiceClient);
  @override
  Future<AuthenticationRespons> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(String email) async {
    return await _appServiceClient.forgotPassword(email);
  }

  @override
  Future<ProductInformationResponse> getProductInformation(String id) async {
    return await _appServiceClient.getProductInformation(id);
  }

  @override
  Future<AcountInformationResponse> getAcountInformation() async {
    return await _appServiceClient.getAcountInformaiton();
  }

  @override
  Future<AuthenticationRespons> register(
      RegisterRequest registerRequest) async {
    return await _appServiceClient.register(
      registerRequest.email,
      registerRequest.password,
      registerRequest. firstName,
      registerRequest. lastName, 
    );
  }

  @override
  Future<ProductSearchListResponse> getProductSearchList(String s,
      {String resultsPerPage = "10"}) async {
    return await _appServiceClient.getProductSearchList(s,
        resultsPerPage: resultsPerPage);
  }

  @override
  Future<CategoryListResponse> getCategoryList(String productId,
      {int page = 0,
      int resultsPerPage = 1,
      int with_category_tree = 0}) async {
    return await _appServiceClient.getCategories(productId,
        page: page,
        resultsPerPage: resultsPerPage,
        with_category_tree: with_category_tree);
  }

  @override
  Future<UserCartResponse> updatCart({
    String? update,
    int? id_product,
    int? id_product_attribute,
    String? op,
    String? action,
    int? qty,
    int? delete,
  }) async {
    return await _appServiceClient.updateCart(
      update: update,
      id_product: id_product,
      id_product_attribute: id_product_attribute,
      op: op,
      action: action,
      qty: qty,
      delete: delete,
    );
  }
}
