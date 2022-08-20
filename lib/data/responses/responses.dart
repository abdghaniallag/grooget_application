import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "code")
  int? code;
}

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "id_shop")
  String? id_shop;
  @JsonKey(name: "id_shop_group")
  String? id_shop_group;
  @JsonKey(name: "id_gender")
  String? id_gender;
  @JsonKey(name: "id_lang")
  String? id_lang;
  @JsonKey(name: "lastname")
  String? lastname;
  @JsonKey(name: "firstname")
  String? firstname;
  @JsonKey(name: "birthday")
  String? birthday;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "newsletter")
  String? newsletter;
  @JsonKey(name: "logged")
  int? logged;
  @JsonKey(name: "active")
  String? active;
  CustomerResponse(
    this.id,
    this.id_shop,
    this.id_shop_group,
    this.id_gender,
    this.id_lang,
    this.lastname,
    this.firstname,
    this.birthday,
    this.email,
    this.newsletter,
    this.logged,
    this.active,
  );

  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}

@JsonSerializable()
class CustomerAcountInformationResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "id_shop")
  String? id_shop;
  @JsonKey(name: "id_shop_group")
  String? id_shop_group;
  @JsonKey(name: "id_gender")
  String? id_gender;
  @JsonKey(name: "id_lang")
  String? id_lang;
  @JsonKey(name: "lastname")
  String? lastname;
  @JsonKey(name: "firstname")
  String? firstname;
  @JsonKey(name: "birthday")
  String? birthday;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "newsletter")
  String? newsletter;
  @JsonKey(name: "logged")
  bool? logged;
  @JsonKey(name: "active")
  String? active;
  CustomerAcountInformationResponse(
    this.id,
    this.id_shop,
    this.id_shop_group,
    this.id_gender,
    this.id_lang,
    this.lastname,
    this.firstname,
    this.birthday,
    this.email,
    this.newsletter,
    this.logged,
    this.active,
  );

  factory CustomerAcountInformationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CustomerAcountInformationResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$CustomerAcountInformationResponseToJson(this);
}

@JsonSerializable()
class PrestashopLoginRespons extends BaseResponse {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "customer_id")
  String? customer_id;
  @JsonKey(name: "session_data")
  int? session_data;
  @JsonKey(name: "cart_count")
  int? cart_count;
  @JsonKey(name: "user")
  CustomerResponse? user;
  PrestashopLoginRespons(this.status, this.message, this.customer_id,
      this.session_data, this.cart_count, this.user);

  factory PrestashopLoginRespons.fromJson(Map<String, dynamic> json) =>
      _$PrestashopLoginResponsFromJson(json);
  Map<String, dynamic> toJson() => _$PrestashopLoginResponsToJson(this);
}

@JsonSerializable()
class AuthenticationRespons extends BaseResponse {
  @JsonKey(name: "psdata")
  PrestashopLoginRespons? psdata;
  AuthenticationRespons(this.psdata);

  factory AuthenticationRespons.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponsFromJson(json);
  Map<String, dynamic> toJson() => _$AuthenticationResponsToJson(this);
}

@JsonSerializable()
class AcountInformationResponse extends BaseResponse {
  @JsonKey(name: "psdata")
  CustomerAcountInformationResponse? psdata;
  AcountInformationResponse(this.psdata);

  factory AcountInformationResponse.fromJson(Map<String, dynamic> json) =>
      _$AcountInformationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AcountInformationResponseToJson(this);
}

@JsonSerializable()
class ImageSourceResponse extends BaseResponse {
  @JsonKey(name: "src")
  String? src;
  ImageSourceResponse(this.src);

  factory ImageSourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageSourceResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ImageSourceResponseToJson(this);
}

@JsonSerializable()
class ImagePrestashopResponse extends BaseResponse {
  @JsonKey(name: "")
  List<ImageSourceResponse>? src;
  ImagePrestashopResponse(this.src);

  factory ImagePrestashopResponse.fromJson(Map<String, dynamic> json) =>
      _$ImagePrestashopResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ImagePrestashopResponseToJson(this);
}

@JsonSerializable()
class ForgotPasswordResponse extends BaseResponse {
  @JsonKey(name: 'support')
  String? support;

  ForgotPasswordResponse(this.support);

// toJson
  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);

//fromJson
  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);
}

@JsonSerializable()
class ServiceResponse extends BaseResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "image")
  String? image;
  ServiceResponse(this.id, this.title, this.image);

  factory ServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceResponseToJson(this);
}

@JsonSerializable()
class StoresResponse extends BaseResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "image")
  String? image;
  StoresResponse(this.id, this.title, this.image);

  factory StoresResponse.fromJson(Map<String, dynamic> json) =>
      _$StoresResponseFromJson(json);
  Map<String, dynamic> toJson() => _$StoresResponseToJson(this);
}

@JsonSerializable()
class BannersResponse extends BaseResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "link")
  String? link;
  BannersResponse(this.id, this.title, this.image, this.link);

  factory BannersResponse.fromJson(Map<String, dynamic> json) =>
      _$BannersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BannersResponseToJson(this);
}

@JsonSerializable()
class HomeDataResponse extends BaseResponse {
  @JsonKey(name: "services")
  List<ServiceResponse>? services;
  @JsonKey(name: "stores")
  List<StoresResponse>? stores;
  @JsonKey(name: "banners")
  List<BannersResponse>? banners;

  HomeDataResponse(this.services, this.stores, this.banners);
  factory HomeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeDataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HomeDataResponseToJson(this);
}

@JsonSerializable()
class HomeResponse extends BaseResponse {
  @JsonKey(name: "data")
  HomeDataResponse? homeData;

  HomeResponse(this.homeData);
  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}
