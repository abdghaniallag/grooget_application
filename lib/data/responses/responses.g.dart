// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..success = json['success'] as bool?
  ..code = json['code'] as int?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
    };

CustomerResponse _$CustomerResponseFromJson(Map<String, dynamic> json) =>
    CustomerResponse(
      json['id'] as String?,
      json['id_shop'] as String?,
      json['id_shop_group'] as String?,
      json['id_gender'] as String?,
      json['id_lang'] as String?,
      json['lastname'] as String?,
      json['firstname'] as String?,
      json['birthday'] as String?,
      json['email'] as String?,
      json['newsletter'] as String?,
      json['logged'] as int?,
      json['active'] as String?,
    );

Map<String, dynamic> _$CustomerResponseToJson(CustomerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_shop': instance.id_shop,
      'id_shop_group': instance.id_shop_group,
      'id_gender': instance.id_gender,
      'id_lang': instance.id_lang,
      'lastname': instance.lastname,
      'firstname': instance.firstname,
      'birthday': instance.birthday,
      'email': instance.email,
      'newsletter': instance.newsletter,
      'logged': instance.logged,
      'active': instance.active,
    };

PrestashopLoginRespons _$PrestashopLoginResponsFromJson(
        Map<String, dynamic> json) =>
    PrestashopLoginRespons(
      json['status'] as String?,
      json['message'] as String?,
      json['customer_id'] as String?,
      json['session_data'] as int?,
      json['cart_count'] as int?,
      json['user'] == null
          ? null
          : CustomerResponse.fromJson(json['user'] as Map<String, dynamic>),
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$PrestashopLoginResponsToJson(
        PrestashopLoginRespons instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'status': instance.status,
      'message': instance.message,
      'customer_id': instance.customer_id,
      'session_data': instance.session_data,
      'cart_count': instance.cart_count,
      'user': instance.user,
    };

AuthenticationRespons _$AuthenticationResponsFromJson(
        Map<String, dynamic> json) =>
    AuthenticationRespons(
      json['psdata'] == null
          ? null
          : PrestashopLoginRespons.fromJson(
              json['psdata'] as Map<String, dynamic>),
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$AuthenticationResponsToJson(
        AuthenticationRespons instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'psdata': instance.psdata,
    };

ForgotPasswordResponse _$ForgotPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordResponse(
      json['support'] as String?,
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$ForgotPasswordResponseToJson(
        ForgotPasswordResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'support': instance.support,
    };

ServiceResponse _$ServiceResponseFromJson(Map<String, dynamic> json) =>
    ServiceResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['image'] as String?,
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$ServiceResponseToJson(ServiceResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
    };

StoresResponse _$StoresResponseFromJson(Map<String, dynamic> json) =>
    StoresResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['image'] as String?,
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$StoresResponseToJson(StoresResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
    };

BannersResponse _$BannersResponseFromJson(Map<String, dynamic> json) =>
    BannersResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['image'] as String?,
      json['link'] as String?,
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$BannersResponseToJson(BannersResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'link': instance.link,
    };

HomeDataResponse _$HomeDataResponseFromJson(Map<String, dynamic> json) =>
    HomeDataResponse(
      (json['services'] as List<dynamic>?)
          ?.map((e) => ServiceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['stores'] as List<dynamic>?)
          ?.map((e) => StoresResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['banners'] as List<dynamic>?)
          ?.map((e) => BannersResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$HomeDataResponseToJson(HomeDataResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'services': instance.services,
      'stores': instance.stores,
      'banners': instance.banners,
    };

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      json['data'] == null
          ? null
          : HomeDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'data': instance.homeData,
    };
