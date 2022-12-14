import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

//------------------ product responses ---------------------------------
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
class CombinationsItemResponse extends BaseResponse {
  @JsonKey(name: "id_product_attribute")
  int? id_product_attribute;
  @JsonKey(name: "quantity")
  int? quantity;
  @JsonKey(name: "price")
  String? price;
  @JsonKey(name: "float_price")
  double? float_price;
  @JsonKey(name: "minimal_quantity")
  int? minimal_quantity;
  @JsonKey(name: "combination_code")
  String? combination_code;
  CombinationsItemResponse(this.id_product_attribute, this.quantity, this.price,
      this.float_price, this.combination_code);

  factory CombinationsItemResponse.fromJson(Map<String, dynamic> json) =>
      _$CombinationsItemResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CombinationsItemResponseToJson(this);
}

@JsonSerializable()
class OptionItemResponse extends BaseResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "value")
  String? value;
  @JsonKey(name: "hex_value")
  String? hex_value;
  OptionItemResponse(this.id, this.value, this.hex_value);

  factory OptionItemResponse.fromJson(Map<String, dynamic> json) =>
      _$OptionItemResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OptionItemResponseToJson(this);
}

@JsonSerializable()
class OptionResponse extends BaseResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "is_color_option")
  int? is_color_option;
  List<OptionItemResponse?>? items;
  OptionResponse(this.id, this.title, this.is_color_option,
      {@required this.items});

  factory OptionResponse.fromJson(Map<String, dynamic> json) =>
      _$OptionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OptionResponseToJson(this);
}

@JsonSerializable()
class ProductInfoItemResponse extends BaseResponse {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "value")
  String? value;
  ProductInfoItemResponse(this.name, this.value);

  factory ProductInfoItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductInfoItemResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductInfoItemResponseToJson(this);
}

@JsonSerializable()
class CoverResponse extends BaseResponse {
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "width")
  int? width;
  @JsonKey(name: "height")
  int? height;
  CoverResponse(this.url, this.width, this.height);

  factory CoverResponse.fromJson(Map<String, dynamic> json) =>
      _$CoverResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CoverResponseToJson(this);
}

@JsonSerializable()
class ProductItemResponse extends BaseResponse {
  @JsonKey(name: "id_product")
  String? id_product;
  @JsonKey(name: "price")
  String? price;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "cover")
  CoverResponse? cover;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "description_short")
  String? description_short;
  @JsonKey(name: "category_name")
  String? category_name;
  ProductItemResponse(
    this.id_product,
    this.price,
    this.name,
    this.cover,
    this.description,
    this.description_short,
    this.category_name,
  );
  factory ProductItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductItemResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductItemResponseToJson(this);
}

@JsonSerializable()
class ProductResponse extends BaseResponse {
  @JsonKey(name: "id_product")
  int? id_product;
  @JsonKey(name: "quantity")
  int? quantity;
  @JsonKey(name: "float_price")
  double? float_price;
  @JsonKey(name: "price")
  String? price;
  @JsonKey(name: "available_for_order")
  String? available_for_order;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "minimal_quantity")
  String? minimal_quantity;
  @JsonKey(name: "cover_image")
  String? cover_image;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "description_short")
  String? description_short;
  @JsonKey(name: "category_name")
  String? category_name;
  List<CombinationsItemResponse?>? combinations;
  List<OptionResponse?>? options;
  List<ImageSourceResponse?>? images;
  String? reference;
  List<ProductInfoItemResponse?>? product_info;
  ProductResponse(
      this.id_product,
      this.quantity,
      this.float_price,
      this.price,
      this.available_for_order,
      this.name,
      this.minimal_quantity,
      this.cover_image,
      this.description,
      this.description_short,
      this.category_name,
      this.reference,
      {@required this.combinations,
      this.options,
      this.images,
      this.product_info});
  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

@JsonSerializable()
class ProductInformationResponse extends BaseResponse {
  @JsonKey(name: "psdata")
  ProductResponse? psdata;
  ProductInformationResponse(this.psdata);

  factory ProductInformationResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductInformationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductInformationResponseToJson(this);
}

@JsonSerializable()
class ProductSearchResponse extends BaseResponse {
  @JsonKey(name: "label")
  String? label;
  List<ProductItemResponse>? products;
  ProductSearchResponse(this.label, {@required this.products});

  factory ProductSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductSearchResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductSearchResponseToJson(this);
}

@JsonSerializable()
class ProductSearchListResponse extends BaseResponse {
  @JsonKey(name: "psdata")
  ProductSearchResponse? psdata;
  ProductSearchListResponse(this.psdata);

  factory ProductSearchListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductSearchListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductSearchListResponseToJson(this);
}

//----------------- category responses --------------------------------

@JsonSerializable()
class CategoryImageSourceResponse extends BaseResponse {
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "width")
  int? width;
  @JsonKey(name: "height")
  int? height;
  CategoryImageSourceResponse(this.url, this.width, this.height);

  factory CategoryImageSourceResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryImageSourceResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryImageSourceResponseToJson(this);
}

@JsonSerializable()
class CategoryImageResponse extends BaseResponse {
  @JsonKey(name: "small")
  CategoryImageSourceResponse? small;
  @JsonKey(name: "medium")
  CategoryImageSourceResponse? medium;
  @JsonKey(name: "large")
  CategoryImageSourceResponse? large;
  CategoryImageResponse(this.small, this.medium, this.large);

  factory CategoryImageResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryImageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryImageResponseToJson(this);
}

@JsonSerializable()
class SortOrderResponse extends BaseResponse {
  @JsonKey(name: "entity")
  String? entity;
  @JsonKey(name: "field")
  String? field;
  @JsonKey(name: "direction")
  String? direction;
  @JsonKey(name: "label")
  String? label;
  @JsonKey(name: "urlParameter")
  String? urlParameter;
  @JsonKey(name: "current")
  bool? current;
  SortOrderResponse(
    this.entity,
    this.field,
    this.direction,
    this.label,
    this.urlParameter,
    this.current,
  );

  factory SortOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$SortOrderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SortOrderResponseToJson(this);
}

@JsonSerializable()
class PaginationResponse extends BaseResponse {
  @JsonKey(name: "total_items")
  int? total_items;
  @JsonKey(name: "items_shown_from")
  int? items_shown_from;
  @JsonKey(name: "items_shown_to")
  int? items_shown_to;
  @JsonKey(name: "current_page")
  int? current_page;
  @JsonKey(name: "pages_count")
  int? pages_count;
  PaginationResponse(
    this.total_items,
    this.items_shown_from,
    this.items_shown_to,
    this.current_page,
    this.pages_count,
  );

  factory PaginationResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationResponseToJson(this);
}

@JsonSerializable()
class PropertyResponse extends BaseResponse {
  @JsonKey(name: "color")
  String? color;
  @JsonKey(name: "symbol")
  String? symbol;
  @JsonKey(name: "min")
  int? min;
  @JsonKey(name: "max")
  int? max;
  PropertyResponse({
    this.color = "",
    this.symbol = "",
    this.min = 0,
    this.max = 20000,
  });

  factory PropertyResponse.fromJson(Map<String, dynamic> json) =>
      _$PropertyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PropertyResponseToJson(this);
}

@JsonSerializable()
class FiltersResponse extends BaseResponse {
  @JsonKey(name: "label")
  String? label;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "active")
  bool? active;
  @JsonKey(name: "displayed")
  bool? displayed;
  @JsonKey(name: "magnitude")
  int? magnitude;
  @JsonKey(name: "value")
  dynamic value;
  FiltersResponse(
    this.label,
    this.type,
    this.active,
    this.displayed,
    this.magnitude,
    this.value,
  );

  factory FiltersResponse.fromJson(Map<String, dynamic> json) =>
      _$FiltersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FiltersResponseToJson(this);
}

@JsonSerializable()
class FacetsResponse extends BaseResponse {
  @JsonKey(name: "label")
  String? label;
  @JsonKey(name: "displayed")
  bool? displayed;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "multipleSelectionAllowed")
  bool? multipleSelectionAllowed;
  @JsonKey(name: "widgetType")
  String? widgetType;
  @JsonKey(name: "filters")
  List<FiltersResponse?>? filters;
  FacetsResponse(
    this.label,
    this.displayed,
    this.type,
    this.multipleSelectionAllowed,
    this.widgetType,
    this.filters,
  );

  factory FacetsResponse.fromJson(Map<String, dynamic> json) =>
      _$FacetsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FacetsResponseToJson(this);
}

@JsonSerializable()
class CategoryProductItemResponse extends BaseResponse {
  @JsonKey(name: "id_product")
  String? id_product;
  @JsonKey(name: "price")
  String? price;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "cover")
  CategoryImageSourceResponse? cover;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "description_short")
  String? description_short;
  @JsonKey(name: "category_name")
  String? category_name;
  CategoryProductItemResponse(
    this.id_product,
    this.price,
    this.name,
    this.cover,
    this.description,
    this.description_short,
    this.category_name,
  );
  factory CategoryProductItemResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductItemResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryProductItemResponseToJson(this);
}

@JsonSerializable()
class CategoryResponse extends BaseResponse {
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "active")
  String? active;
  @JsonKey(name: "cover")
  CategoryImageResponse? cover;
  @JsonKey(name: "label")
  String? label;
  @JsonKey(name: "Pagination")
  PaginationResponse? pagination;
  List<CategoryProductItemResponse?>? products;
  List<SortOrderResponse?>? sort_orders;
  List<FacetsResponse?>? facets;
  CategoryResponse(
      this.description, this.active, this.cover, this.label, this.pagination,
      {@required this.products, this.sort_orders, this.facets});
  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}

@JsonSerializable()
class CategoryListResponse extends BaseResponse {
  @JsonKey(name: "psdata")
  CategoryResponse? psdata;
  CategoryListResponse(this.psdata);

  factory CategoryListResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryListResponseToJson(this);
}

//-------------------------------- Cart responses  -------------------------------------------------
@JsonSerializable()
class TotalResponse extends BaseResponse {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "label")
  String? label;
  @JsonKey(name: "amount")
  double? amount;
  @JsonKey(name: "value")
  String? value;
  TotalResponse(this.type, this.label, this.amount, this.value);
  factory TotalResponse.fromJson(Map<String, dynamic> json) =>
      _$TotalResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TotalResponseToJson(this);
}

@JsonSerializable()
class TotalsResponse extends BaseResponse {
  @JsonKey(name: "total")
  TotalResponse? total;
  @JsonKey(name: "total_including_tax")
  TotalResponse? total_including_tax;
  @JsonKey(name: "total_excluding_tax")
  TotalResponse? total_excluding_tax;
  TotalsResponse(
      this.total, this.total_including_tax, this.total_excluding_tax);
  factory TotalsResponse.fromJson(Map<String, dynamic> json) =>
      _$TotalsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TotalsResponseToJson(this);
}

@JsonSerializable()
class SubtotalsResponse extends BaseResponse {
  @JsonKey(name: "products")
  TotalResponse? products;
  @JsonKey(name: "shipping")
  TotalResponse? shipping;
  @JsonKey(name: "tax")
  TotalResponse? tax;
  SubtotalsResponse(this.products, this.shipping, this.tax);
  factory SubtotalsResponse.fromJson(Map<String, dynamic> json) =>
      _$SubtotalsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SubtotalsResponseToJson(this);
}

@JsonSerializable()
class LabelsResponse extends BaseResponse {
  @JsonKey(name: "tax_short")
  String? tax_short;
  @JsonKey(name: "tax_long")
  String? tax_long;
  LabelsResponse(this.tax_short, this.tax_long);
  factory LabelsResponse.fromJson(Map<String, dynamic> json) =>
      _$LabelsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LabelsResponseToJson(this);
}

@JsonSerializable()
class VouchersResponse extends BaseResponse {
  @JsonKey(name: "allowed")
  int? allowed;
  @JsonKey(name: "tax_long")
  List<dynamic>? added;
  VouchersResponse(this.allowed, this.added);
  factory VouchersResponse.fromJson(Map<String, dynamic> json) =>
      _$VouchersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VouchersResponseToJson(this);
}

@JsonSerializable()
class ProductCartResponse extends BaseResponse {
  @JsonKey(name: "id_product_attribute")
  String? id_product_attribute;
  @JsonKey(name: "id_product")
  String? id_product;
  @JsonKey(name: "cart_quantity")
  String? cart_quantity;
  @JsonKey(name: "id_shop")
  String? id_shop;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description_short")
  String? description_short;
  @JsonKey(name: "id_category_default")
  String? id_category_default;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "date_add")
  String? date_add;
  @JsonKey(name: "date_upd")
  String? date_upd;
  @JsonKey(name: "quantity")
  int? quantity;
  @JsonKey(name: "total")
  dynamic? total;
  @JsonKey(name: "total_wt")
  dynamic? total_wt;
  @JsonKey(name: "price_wt")
  dynamic price_wt;
  @JsonKey(name: "minimal_quantity")
  dynamic minimal_quantity;
  @JsonKey(name: "attributes_small")
  String? attributes_small;
  @JsonKey(name: "price_with_reduction_without_tax")
  dynamic price_with_reduction_without_tax;
  @JsonKey(name: "image_url")
  String? image_url;
  @JsonKey(name: "reference")
  String? reference;
  ProductCartResponse(
    this.id_product_attribute,
    this.id_product,
    this.cart_quantity,
    this.id_shop,
    this.name,
    this.description_short,
    this.id_category_default,
    this.price,
    this.date_add,
    this.date_upd,
    this.quantity,
    this.total,
    this.total_wt,
    this.price_wt,
    this.attributes_small,
    this.price_with_reduction_without_tax,
    this.image_url,
    this.reference,
  );
  factory ProductCartResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductCartResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductCartResponseToJson(this);
}

@JsonSerializable()
class CartResponse extends BaseResponse {
  @JsonKey(name: "totals")
  TotalsResponse? totals;
  @JsonKey(name: "subtotals")
  TotalsResponse? subtotals;
  @JsonKey(name: "products_count")
  int? products_count;
  @JsonKey(name: "labels")
  LabelsResponse? labels;
  @JsonKey(name: "vouchers")
  VouchersResponse? vouchers;
  List<ProductCartResponse?>? products;
  List<String?>? errors;
  CartResponse(this.totals, this.subtotals, this.products_count, this.labels,
      this.vouchers,
      {@required this.products, this.errors});
  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CartResponseToJson(this);
}

@JsonSerializable()
class UserCartResponse extends BaseResponse {
  @JsonKey(name: "psdata")
  CartResponse? psdata;
  List<String?>? errors;
  UserCartResponse(this.psdata, {@required this.errors});

  factory UserCartResponse.fromJson(Map<String, dynamic> json) =>
      _$UserCartResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserCartResponseToJson(this);
}
