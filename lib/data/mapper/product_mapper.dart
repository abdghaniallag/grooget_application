import 'package:mvvm_first_c/app/extentions.dart';

import '../../domain/models/product.dart';
import '../responses/responses.dart';

const EMPTY = "";
const EMPTY_LIST = [];
const ZERO = 0;
const DZERO = 0.0;
const FALSE = false;

extension ProductMapper on ProductResponse? {
  Product toDomain() {
    List<CombinationsItem> mappedCombinationsItem =
        (this?.combinations?.map((combination) => combination.toDomain()) ??
                Iterable.empty())
            .cast<CombinationsItem>()
            .toList();
    List<Option> mappedOption =
        (this?.options?.map((option) => option.toDomain()) ?? Iterable.empty())
            .cast<Option>()
            .toList();
    List<ImageSource> mappedImages =
        (this?.images?.map((image) => image.toDomain()) ?? Iterable.empty())
            .cast<ImageSource>()
            .toList();
    List<ProductInfoItem> mappedProductInfoItem =
        (this?.product_info?.map((product_info) => product_info.toDomain()) ??
                Iterable.empty())
            .cast<ProductInfoItem>()
            .toList();
    return Product(
      this?.id_product?.orEmpty() ?? ZERO,
      this?.quantity?.orEmpty() ?? ZERO,
      this?.float_price?.orEmpty() ?? DZERO,
      this?.price?.orEmpty() ?? EMPTY,
      this?.available_for_order?.orEmpty() ?? EMPTY,
      this?.name?.orEmpty() ?? EMPTY,
      this?.minimal_quantity?.orEmpty() ?? EMPTY,
      this?.cover_image?.orEmpty() ?? EMPTY,
      this?.description?.orEmpty() ?? EMPTY,
      this?.description_short?.orEmpty() ?? EMPTY,
      this?.category_name?.orEmpty() ?? EMPTY,
      this?.reference?.orEmpty() ?? EMPTY,
      mappedCombinationsItem,
      mappedOption,
      mappedImages,
      mappedProductInfoItem,
    );
  }
}

extension ProductInformationResponseMapper on ProductInformationResponse? {
  ProductInformation toDomain() {
    return ProductInformation(this?.psdata?.toDomain());
  }
}

extension ImagesMapper on ImageSourceResponse? {
  ImageSource toDomain() {
    return ImageSource(this?.src?.orEmpty() ?? EMPTY);
  }
}

extension CombinationsItemMapper on CombinationsItemResponse? {
  CombinationsItem toDomain() {
    return CombinationsItem(
      this?.id_product_attribute?.orEmpty() ?? ZERO,
      this?.quantity?.orEmpty() ?? ZERO,
      this?.price?.orEmpty() ?? EMPTY,
      this?.float_price?.orEmpty() ?? DZERO,
      this?.combination_code?.orEmpty() ?? EMPTY,
      this?.minimal_quantity?.orEmpty() ?? ZERO,
    );
  }
}

extension OptionItemMapper on OptionItemResponse? {
  OptionItem toDomain() {
    return OptionItem(
      this?.id?.orEmpty() ?? ZERO,
      this?.value?.orEmpty() ?? EMPTY,
      this?.hex_value?.orEmpty() ?? EMPTY,
    );
  }
}

extension OptionMapper on OptionResponse? {
  Option toDomain() {
    List<OptionItem> mappedOptionItem =
        (this?.items?.map((items) => items.toDomain()) ??
                const Iterable.empty())
            .cast<OptionItem>()
            .toList();
    return Option(this?.id?.orEmpty() ?? ZERO, this?.title?.orEmpty() ?? EMPTY,
        this?.is_color_option?.orEmpty() ?? ZERO, mappedOptionItem);
  }
}

extension ProductInfoItemMapper on ProductInfoItemResponse? {
  ProductInfoItem toDomain() {
    return ProductInfoItem(
      this?.name?.orEmpty() ?? EMPTY,
      this?.value?.orEmpty() ?? EMPTY,
    );
  }
}

extension CoverMapper on CoverResponse? {
  Cover toDomain() {
    return Cover(
      this?.url?.orEmpty() ?? EMPTY,
      this?.width?.orEmpty() ?? ZERO,
      this?.height?.orEmpty() ?? ZERO,
    );
  }
}

extension ProductItemMapper on ProductItemResponse? {
  ProductItem toDomain() {
    return ProductItem(
      this?.id_product?.orEmpty() ?? EMPTY,
      this?.price?.orEmpty() ?? EMPTY,
      this?.name?.orEmpty() ?? EMPTY,
      this?.cover?.toDomain(),
      this?.description?.orEmpty() ?? EMPTY,
      this?.description_short?.orEmpty() ?? EMPTY,
      this?.category_name?.orEmpty() ?? EMPTY,
    );
  }
}

extension ProductSearchResponseMapper on ProductSearchResponse? {
  ProductSearch toDomain() {
    List<ProductItem> mappedProduct =
        (this?.products?.map((products) => products.toDomain()) ??
                Iterable.empty())
            .cast<ProductItem>()
            .toList();
    return ProductSearch(this?.label?.orEmpty() ?? EMPTY, mappedProduct);
  }
}

extension ProductSearchListResponseMapper on ProductSearchListResponse? {
  ProductSearchList toDomain() {
    return ProductSearchList(this?.psdata?.toDomain());
  }
}
