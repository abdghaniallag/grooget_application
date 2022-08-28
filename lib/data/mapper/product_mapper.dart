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
    List<ImageSource> mappedImages =
        (this?.images?.map((image) => image.toDomain()) ?? Iterable.empty())
            .cast<ImageSource>()
            .toList();
    return Product(
      this?.id_product?.orEmpty() ?? ZERO,
      this?.quantity?.orEmpty() ?? ZERO,
      this?.float_price?.orEmpty() ?? DZERO,
      this?.price?.orEmpty() ?? EMPTY,
      this?.name?.orEmpty() ?? EMPTY,
      this?.minimal_quantity?.orEmpty() ?? EMPTY,
      this?.cover_image?.orEmpty() ?? EMPTY,
      this?.description?.orEmpty() ?? EMPTY,
      this?.description_short?.orEmpty() ?? EMPTY,
      this?.category_name?.orEmpty() ?? EMPTY,
      mappedImages,
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
