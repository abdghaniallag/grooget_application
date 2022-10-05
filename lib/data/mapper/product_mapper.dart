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

//---------------category mapper -----------------------------

extension CategoryProductItemMapper on CategoryProductItemResponse? {
  CategoryProductItem toDomain() {
    return CategoryProductItem(
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

extension CategoryImageMapper on CategoryImageResponse? {
  CategoryImage toDomain() {
    return CategoryImage(
      this?.small?.toDomain(),
      this?.medium?.toDomain(),
      this?.large?.toDomain(),
    );
  }
}

extension CategoryImageSourceMapper on CategoryImageSourceResponse? {
  CategoryImageSource toDomain() {
    return CategoryImageSource(
      this?.url?.orEmpty() ?? EMPTY,
      this?.width?.orEmpty() ?? ZERO,
      this?.height?.orEmpty() ?? ZERO,
    );
  }
}

extension SortOrderRMapper on SortOrderResponse? {
  SortOrder toDomain() {
    return SortOrder(
      this?.entity?.orEmpty() ?? EMPTY,
      this?.field?.orEmpty() ?? EMPTY,
      this?.direction?.orEmpty() ?? EMPTY,
      this?.label?.orEmpty() ?? EMPTY,
      this?.urlParameter?.orEmpty() ?? EMPTY,
      this?.current?.orEmpty() ?? FALSE,
    );
  }
}

extension PaginationMapper on PaginationResponse? {
  Pagination toDomain() {
    return Pagination(
      this?.total_items?.orEmpty() ?? ZERO,
      this?.items_shown_from?.orEmpty() ?? ZERO,
      this?.items_shown_to?.orEmpty() ?? ZERO,
      this?.current_page?.orEmpty() ?? ZERO,
      this?.pages_count?.orEmpty() ?? ZERO,
    );
  }
}

extension PropertyMapper on PropertyResponse? {
  Property toDomain() {
    return Property();
  }
}

extension FiltersMapper on FiltersResponse? {
  Filters toDomain() {
    return Filters(
      this?.label?.orEmpty() ?? EMPTY,
      this?.type?.orEmpty() ?? EMPTY,
      this?.active?.orEmpty() ?? FALSE,
      this?.displayed?.orEmpty() ?? FALSE,
      this?.magnitude?.orEmpty() ?? ZERO,
      this?.value,
    );
  }
}

extension FacetsMapper on FacetsResponse? {
  Facets toDomain() {
    List<Filters> mappedFilters =
        (this?.filters?.map((filter) => filter.toDomain()) ?? Iterable.empty())
            .cast<Filters>()
            .toList();
    return Facets(
      this?.label?.orEmpty() ?? EMPTY,
      this?.displayed?.orEmpty() ?? FALSE,
      this?.type?.orEmpty() ?? EMPTY,
      this?.multipleSelectionAllowed?.orEmpty() ?? FALSE,
      this?.widgetType?.orEmpty() ?? EMPTY,
      mappedFilters,
    );
  }
}

extension CategoryMapper on CategoryResponse? {
  Category toDomain() {
    List<CategoryProductItem> mappedProducts =
        (this?.products?.map((product) => product.toDomain()) ??
                Iterable.empty())
            .cast<CategoryProductItem>()
            .toList();
    List<SortOrder> mappedSortOrders =
        (this?.sort_orders?.map((sort_order) => sort_order.toDomain()) ??
                Iterable.empty())
            .cast<SortOrder>()
            .toList();
    List<Facets> mappedFacets =
        (this?.facets?.map((facet) => facet.toDomain()) ?? Iterable.empty())
            .cast<Facets>()
            .toList();
    return Category(
      this?.description?.orEmpty() ?? EMPTY,
      this?.active?.orEmpty() ?? EMPTY,
      this?.cover.toDomain(),
      this?.label?.orEmpty() ?? EMPTY,
      this?.pagination?.toDomain(),
      mappedProducts,
      mappedSortOrders,
      mappedFacets,
    );
  }
}

extension CategoryListMapper on CategoryListResponse? {
  CategoryList toDomain() {
    return CategoryList(this?.psdata?.toDomain());
  }
}
