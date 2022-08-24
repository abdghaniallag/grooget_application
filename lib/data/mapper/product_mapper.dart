import '../../app/extentions.dart';
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
      mappedImages,
      this?.cover_image?.orEmpty() ?? EMPTY,
      this?.description?.orEmpty() ?? EMPTY,
      this?.description_short?.orEmpty() ?? EMPTY,
      this?.category_name?.orEmpty() ?? EMPTY,
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

extension ProductSearchResponseMapper on ProductSearchResponse? {
  ProductSearch toDomain() {
    List<Product> mappedProduct =
        (this?.products?.map((products) => products.toDomain()) ??
                Iterable.empty())
            .cast<Product>()
            .toList();
    return ProductSearch(this?.label?.orEmpty() ?? EMPTY, mappedProduct);
  }
}

extension ProductSearchListResponseMapper on ProductSearchListResponse? {
  ProductSearchList toDomain() {
    return ProductSearchList(this?.psdata?.toDomain());
  }
}
