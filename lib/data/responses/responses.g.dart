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

CombinationsItemResponse _$CombinationsItemResponseFromJson(
        Map<String, dynamic> json) =>
    CombinationsItemResponse(
      json['id_product_attribute'] as int?,
      json['quantity'] as int?,
      json['price'] as String?,
      (json['float_price'] as num?)?.toDouble(),
      json['combination_code'] as String?,
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?
      ..minimal_quantity = json['minimal_quantity'] as int?;

Map<String, dynamic> _$CombinationsItemResponseToJson(
        CombinationsItemResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'id_product_attribute': instance.id_product_attribute,
      'quantity': instance.quantity,
      'price': instance.price,
      'float_price': instance.float_price,
      'minimal_quantity': instance.minimal_quantity,
      'combination_code': instance.combination_code,
    };

OptionItemResponse _$OptionItemResponseFromJson(Map<String, dynamic> json) =>
    OptionItemResponse(
      json['id'] as int?,
      json['value'] as String?,
      json['hex_value'] as String?,
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$OptionItemResponseToJson(OptionItemResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'id': instance.id,
      'value': instance.value,
      'hex_value': instance.hex_value,
    };

OptionResponse _$OptionResponseFromJson(Map<String, dynamic> json) =>
    OptionResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['is_color_option'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : OptionItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$OptionResponseToJson(OptionResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'id': instance.id,
      'title': instance.title,
      'is_color_option': instance.is_color_option,
      'items': instance.items,
    };

ProductInfoItemResponse _$ProductInfoItemResponseFromJson(
        Map<String, dynamic> json) =>
    ProductInfoItemResponse(
      json['name'] as String?,
      json['value'] as String?,
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$ProductInfoItemResponseToJson(
        ProductInfoItemResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
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
      json['available_for_order'] as String?,
      json['name'] as String?,
      json['minimal_quantity'] as String?,
      json['cover_image'] as String?,
      json['description'] as String?,
      json['description_short'] as String?,
      json['category_name'] as String?,
      json['reference'] as String?,
      combinations: (json['combinations'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CombinationsItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : OptionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ImageSourceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      product_info: (json['product_info'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ProductInfoItemResponse.fromJson(e as Map<String, dynamic>))
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
      'available_for_order': instance.available_for_order,
      'name': instance.name,
      'minimal_quantity': instance.minimal_quantity,
      'cover_image': instance.cover_image,
      'description': instance.description,
      'description_short': instance.description_short,
      'category_name': instance.category_name,
      'combinations': instance.combinations,
      'options': instance.options,
      'images': instance.images,
      'reference': instance.reference,
      'product_info': instance.product_info,
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

CategoryImageSourceResponse _$CategoryImageSourceResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryImageSourceResponse(
      json['url'] as String?,
      json['width'] as int?,
      json['height'] as int?,
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$CategoryImageSourceResponseToJson(
        CategoryImageSourceResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };

CategoryImageResponse _$CategoryImageResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryImageResponse(
      json['small'] == null
          ? null
          : CategoryImageSourceResponse.fromJson(
              json['small'] as Map<String, dynamic>),
      json['medium'] == null
          ? null
          : CategoryImageSourceResponse.fromJson(
              json['medium'] as Map<String, dynamic>),
      json['large'] == null
          ? null
          : CategoryImageSourceResponse.fromJson(
              json['large'] as Map<String, dynamic>),
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$CategoryImageResponseToJson(
        CategoryImageResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
    };

SortOrderResponse _$SortOrderResponseFromJson(Map<String, dynamic> json) =>
    SortOrderResponse(
      json['entity'] as String?,
      json['field'] as String?,
      json['direction'] as String?,
      json['label'] as String?,
      json['urlParameter'] as String?,
      json['current'] as bool?,
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$SortOrderResponseToJson(SortOrderResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'entity': instance.entity,
      'field': instance.field,
      'direction': instance.direction,
      'label': instance.label,
      'urlParameter': instance.urlParameter,
      'current': instance.current,
    };

PaginationResponse _$PaginationResponseFromJson(Map<String, dynamic> json) =>
    PaginationResponse(
      json['total_items'] as int?,
      json['items_shown_from'] as int?,
      json['items_shown_to'] as int?,
      json['current_page'] as int?,
      json['pages_count'] as int?,
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$PaginationResponseToJson(PaginationResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'total_items': instance.total_items,
      'items_shown_from': instance.items_shown_from,
      'items_shown_to': instance.items_shown_to,
      'current_page': instance.current_page,
      'pages_count': instance.pages_count,
    };

PropertyResponse _$PropertyResponseFromJson(Map<String, dynamic> json) =>
    PropertyResponse(
      color: json['color'] as String? ?? "",
      symbol: json['symbol'] as String? ?? "",
      min: json['min'] as int? ?? 0,
      max: json['max'] as int? ?? 20000,
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$PropertyResponseToJson(PropertyResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'color': instance.color,
      'symbol': instance.symbol,
      'min': instance.min,
      'max': instance.max,
    };

FiltersResponse _$FiltersResponseFromJson(Map<String, dynamic> json) =>
    FiltersResponse(
      json['label'] as String?,
      json['type'] as String?,
      json['active'] as bool?,
      json['displayed'] as bool?,
      json['magnitude'] as int?,
      json['value'],
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$FiltersResponseToJson(FiltersResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'label': instance.label,
      'type': instance.type,
      'active': instance.active,
      'displayed': instance.displayed,
      'magnitude': instance.magnitude,
      'value': instance.value,
    };

FacetsResponse _$FacetsResponseFromJson(Map<String, dynamic> json) =>
    FacetsResponse(
      json['label'] as String?,
      json['displayed'] as bool?,
      json['type'] as String?,
      json['multipleSelectionAllowed'] as bool?,
      json['widgetType'] as String?,
      (json['filters'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : FiltersResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$FacetsResponseToJson(FacetsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'label': instance.label,
      'displayed': instance.displayed,
      'type': instance.type,
      'multipleSelectionAllowed': instance.multipleSelectionAllowed,
      'widgetType': instance.widgetType,
      'filters': instance.filters,
    };

CategoryProductItemResponse _$CategoryProductItemResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryProductItemResponse(
      json['id_product'] as String?,
      json['price'] as String?,
      json['name'] as String?,
      json['cover'] == null
          ? null
          : CategoryImageSourceResponse.fromJson(
              json['cover'] as Map<String, dynamic>),
      json['description'] as String?,
      json['description_short'] as String?,
      json['category_name'] as String?,
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$CategoryProductItemResponseToJson(
        CategoryProductItemResponse instance) =>
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

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) =>
    CategoryResponse(
      json['description'] as String?,
      json['active'] as String?,
      json['cover'] == null
          ? null
          : CategoryImageResponse.fromJson(
              json['cover'] as Map<String, dynamic>),
      json['label'] as String?,
      json['Pagination'] == null
          ? null
          : PaginationResponse.fromJson(
              json['Pagination'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CategoryProductItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      sort_orders: (json['sort_orders'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SortOrderResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      facets: (json['facets'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : FacetsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$CategoryResponseToJson(CategoryResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'description': instance.description,
      'active': instance.active,
      'cover': instance.cover,
      'label': instance.label,
      'Pagination': instance.pagination,
      'products': instance.products,
      'sort_orders': instance.sort_orders,
      'facets': instance.facets,
    };

CategoryListResponse _$CategoryListResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryListResponse(
      json['psdata'] == null
          ? null
          : CategoryResponse.fromJson(json['psdata'] as Map<String, dynamic>),
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$CategoryListResponseToJson(
        CategoryListResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'psdata': instance.psdata,
    };

TotalResponse _$TotalResponseFromJson(Map<String, dynamic> json) =>
    TotalResponse(
      json['type'] as String?,
      json['label'] as String?,
      json['amount'] as int?,
      json['value'] as String?,
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$TotalResponseToJson(TotalResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'type': instance.type,
      'label': instance.label,
      'amount': instance.amount,
      'value': instance.value,
    };

TotalsResponse _$TotalsResponseFromJson(Map<String, dynamic> json) =>
    TotalsResponse(
      json['total'] == null
          ? null
          : TotalResponse.fromJson(json['total'] as Map<String, dynamic>),
      json['total_including_tax'] == null
          ? null
          : TotalResponse.fromJson(
              json['total_including_tax'] as Map<String, dynamic>),
      json['total_excluding_tax'] == null
          ? null
          : TotalResponse.fromJson(
              json['total_excluding_tax'] as Map<String, dynamic>),
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$TotalsResponseToJson(TotalsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'total': instance.total,
      'total_including_tax': instance.total_including_tax,
      'total_excluding_tax': instance.total_excluding_tax,
    };

SubtotalsResponse _$SubtotalsResponseFromJson(Map<String, dynamic> json) =>
    SubtotalsResponse(
      json['products'] == null
          ? null
          : TotalResponse.fromJson(json['products'] as Map<String, dynamic>),
      json['shipping'] == null
          ? null
          : TotalResponse.fromJson(json['shipping'] as Map<String, dynamic>),
      json['tax'] == null
          ? null
          : TotalResponse.fromJson(json['tax'] as Map<String, dynamic>),
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$SubtotalsResponseToJson(SubtotalsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'products': instance.products,
      'shipping': instance.shipping,
      'tax': instance.tax,
    };

LabelsResponse _$LabelsResponseFromJson(Map<String, dynamic> json) =>
    LabelsResponse(
      json['tax_short'] as String?,
      json['tax_long'] as String?,
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$LabelsResponseToJson(LabelsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'tax_short': instance.tax_short,
      'tax_long': instance.tax_long,
    };

VouchersResponse _$VouchersResponseFromJson(Map<String, dynamic> json) =>
    VouchersResponse(
      json['allowed'] as int?,
      json['tax_long'] as List<dynamic>?,
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$VouchersResponseToJson(VouchersResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'allowed': instance.allowed,
      'tax_long': instance.added,
    };

ProductCartResponse _$ProductCartResponseFromJson(Map<String, dynamic> json) =>
    ProductCartResponse(
      json['id_product_attribute'] as String?,
      json['id_product'] as String?,
      json['cart_quantity'] as String?,
      json['id_shop'] as String?,
      json['name'] as String?,
      json['description_short'] as String?,
      json['id_category_default'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['date_add'] as String?,
      json['date_upd'] as String?,
      json['quantity'] as int?,
      json['total'] as int?,
      json['total_wt'] as int?,
      json['price_wt'] as int?,
      json['attributes_small'] as String?,
      json['price_with_reduction_without_tax'] as int?,
      json['image_url'] as String?,
      json['reference'] as String?,
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$ProductCartResponseToJson(
        ProductCartResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'id_product_attribute': instance.id_product_attribute,
      'id_product': instance.id_product,
      'cart_quantity': instance.cart_quantity,
      'id_shop': instance.id_shop,
      'name': instance.name,
      'description_short': instance.description_short,
      'id_category_default': instance.id_category_default,
      'price': instance.price,
      'date_add': instance.date_add,
      'date_upd': instance.date_upd,
      'quantity': instance.quantity,
      'total': instance.total,
      'total_wt': instance.total_wt,
      'price_wt': instance.price_wt,
      'attributes_small': instance.attributes_small,
      'price_with_reduction_without_tax':
          instance.price_with_reduction_without_tax,
      'image_url': instance.image_url,
      'reference': instance.reference,
    };

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) => CartResponse(
      json['totals'] == null
          ? null
          : TotalsResponse.fromJson(json['totals'] as Map<String, dynamic>),
      json['subtotals'] == null
          ? null
          : TotalsResponse.fromJson(json['subtotals'] as Map<String, dynamic>),
      json['products_count'] as int?,
      json['labels'] == null
          ? null
          : LabelsResponse.fromJson(json['labels'] as Map<String, dynamic>),
      json['vouchers'] == null
          ? null
          : VouchersResponse.fromJson(json['vouchers'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ProductCartResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$CartResponseToJson(CartResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'totals': instance.totals,
      'subtotals': instance.subtotals,
      'products_count': instance.products_count,
      'labels': instance.labels,
      'vouchers': instance.vouchers,
      'products': instance.products,
      'errors': instance.errors,
    };

UserCartResponse _$UserCartResponseFromJson(Map<String, dynamic> json) =>
    UserCartResponse(
      json['psdata'] == null
          ? null
          : CartResponse.fromJson(json['psdata'] as Map<String, dynamic>),
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?;

Map<String, dynamic> _$UserCartResponseToJson(UserCartResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'psdata': instance.psdata,
      'errors': instance.errors,
    };
