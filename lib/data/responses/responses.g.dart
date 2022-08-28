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

CustomerAcountInformationResponse _$CustomerAcountInformationResponseFromJson(
        Map<String, dynamic> json) =>
    CustomerAcountInformationResponse(
      json['id'] as int?,
      json['id_shop'] as String?,
      json['id_shop_group'] as String?,
      json['id_gender'] as String?,
      json['id_lang'] as String?,
      json['lastname'] as String?,
      json['firstname'] as String?,
      json['birthday'] as String?,
      json['email'] as String?,
      json['newsletter'] as String?,
      json['logged'] as bool?,
      json['active'] as String?,
    );

Map<String, dynamic> _$CustomerAcountInformationResponseToJson(
        CustomerAcountInformationResponse instance) =>
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

AcountInformationResponse _$AcountInformationResponseFromJson(
        Map<String, dynamic> json) =>
    AcountInformationResponse(
      json['psdata'] == null
          ? null
          : CustomerAcountInformationResponse.fromJson(
              json['psdata'] as Map<String, dynamic>),
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$AcountInformationResponseToJson(
        AcountInformationResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'psdata': instance.psdata,
    };

ImageSourceResponse _$ImageSourceResponseFromJson(Map<String, dynamic> json) =>
    ImageSourceResponse(
      json['src'] as String?,
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$ImageSourceResponseToJson(
        ImageSourceResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'src': instance.src,
    };

CoverResponse _$CoverResponseFromJson(Map<String, dynamic> json) =>
    CoverResponse(
      json['url'] as String?,
      json['width'] as int?,
      json['height'] as int?,
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$CoverResponseToJson(CoverResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };

ProductItemResponse _$ProductItemResponseFromJson(Map<String, dynamic> json) =>
    ProductItemResponse(
      json['id_product'] as String?,
      json['price'] as String?,
      json['name'] as String?,
      json['cover'] == null
          ? null
          : CoverResponse.fromJson(json['cover'] as Map<String, dynamic>),
      json['description'] as String?,
      json['description_short'] as String?,
      json['category_name'] as String?,
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$ProductItemResponseToJson(
        ProductItemResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'id_product': instance.id_product,
      'price': instance.price,
      'name': instance.name,
      'cover': instance.cover,
      'description': instance.description,
      'description_short': instance.description_short,
      'category_name': instance.category_name,
    };

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      json['id_product'] as int?,
      json['quantity'] as int?,
      (json['float_price'] as num?)?.toDouble(),
      json['price'] as String?,
      json['name'] as String?,
      json['minimal_quantity'] as String?,
      json['cover_image'] as String?,
      json['description'] as String?,
      json['description_short'] as String?,
      json['category_name'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ImageSourceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'id_product': instance.id_product,
      'quantity': instance.quantity,
      'float_price': instance.float_price,
      'price': instance.price,
      'name': instance.name,
      'minimal_quantity': instance.minimal_quantity,
      'cover_image': instance.cover_image,
      'description': instance.description,
      'description_short': instance.description_short,
      'category_name': instance.category_name,
      'images': instance.images,
    };

ProductInformationResponse _$ProductInformationResponseFromJson(
        Map<String, dynamic> json) =>
    ProductInformationResponse(
      json['psdata'] == null
          ? null
          : ProductResponse.fromJson(json['psdata'] as Map<String, dynamic>),
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$ProductInformationResponseToJson(
        ProductInformationResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'psdata': instance.psdata,
    };

ProductSearchResponse _$ProductSearchResponseFromJson(
        Map<String, dynamic> json) =>
    ProductSearchResponse(
      json['label'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$ProductSearchResponseToJson(
        ProductSearchResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'label': instance.label,
      'products': instance.products,
    };

ProductSearchListResponse _$ProductSearchListResponseFromJson(
        Map<String, dynamic> json) =>
    ProductSearchListResponse(
      json['psdata'] == null
          ? null
          : ProductSearchResponse.fromJson(
              json['psdata'] as Map<String, dynamic>),
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$ProductSearchListResponseToJson(
        ProductSearchListResponse instance) =>
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
