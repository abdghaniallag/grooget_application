import '../../app/extentions.dart';
import '../../domain/models/cart.dart';
import '../responses/responses.dart';

const EMPTY = "";
const EMPTY_LIST = [];
const ZERO = 0;
const DZERO = 0.0;
const FALSE = false;

extension ProductCartMapper on ProductCartResponse? {
  Product toDomain() {
    return Product(
      this?.id_product_attribute?.orEmpty() ?? EMPTY,
      this?.id_product?.orEmpty() ?? EMPTY,
      this?.cart_quantity?.orEmpty() ?? EMPTY,
      this?.id_shop?.orEmpty() ?? EMPTY,
      this?.name?.orEmpty() ?? EMPTY,
      this?.description_short?.orEmpty() ?? EMPTY,
      this?.id_category_default?.orEmpty() ?? EMPTY,
      this?.price?.orEmpty() ?? DZERO,
      this?.date_add?.orEmpty() ?? EMPTY,
      this?.date_upd?.orEmpty() ?? EMPTY,
      this?.quantity?.orEmpty() ?? ZERO,
      this?.total?.orEmpty() ?? ZERO,
      this?.total_wt?.orEmpty() ?? ZERO,
      this?.price_wt?.orEmpty() ?? ZERO,
      this?.attributes_small?.orEmpty() ?? EMPTY,
      this?.price_with_reduction_without_tax?.orEmpty() ?? ZERO,
      this?.image_url?.orEmpty() ?? EMPTY,
      this?.reference?.orEmpty() ?? EMPTY,
    );
  }
}

extension VouchersMapper on VouchersResponse? {
  Vouchers toDomain() {
    List<String> mappedAdded =
        (this?.added?.map((a) => a?.toString().orEmpty() ?? EMPTY) ??
                Iterable.empty())
            .cast<String>()
            .toList();
    return Vouchers(
      this?.allowed?.orEmpty() ?? ZERO,
      mappedAdded,
    );
  }
}

extension LabelsMapper on LabelsResponse? {
  Labels toDomain() {
    return Labels(
      this?.tax_short?.orEmpty() ?? EMPTY,
      this?.tax_long?.orEmpty() ?? EMPTY,
    );
  }
}

extension TotalMapper on TotalResponse? {
  Total toDomain() {
    return Total(
      this?.type?.orEmpty() ?? EMPTY,
      this?.label?.orEmpty() ?? EMPTY,
      this?.amount?.orEmpty() ?? ZERO,
      this?.value?.orEmpty() ?? EMPTY,
    );
  }
}

extension TotalsMapper on TotalsResponse? {
  Totals toDomain() {
    return Totals(
      this?.total.toDomain(),
      this?.total_including_tax.toDomain(),
      this?.total_excluding_tax.toDomain(),
    );
  }
}

extension SubtotalsMapper on SubtotalsResponse? {
  Subtotals toDomain() {
    return Subtotals(
      this?.products.toDomain(),
      this?.shipping.toDomain(),
      this?.tax.toDomain(),
    );
  }
}

extension CartMapper on CartResponse? {
  Cart toDomain() {
    List<Product> mappedProduct =
        (this?.products?.map((a) => a?.toDomain()) ?? Iterable.empty())
            .cast<Product>()
            .toList();
    return Cart(
      this?.totals.toDomain(),
      this?.subtotals.toDomain(),
      this?.products_count.orEmpty() ?? ZERO,
      this?.labels.toDomain(),
      this?.vouchers.toDomain(),
      mappedProduct,
    );
  }
}

extension UserCartMapper on UserCartResponse? {
  UserCart toDomain() {
    List<String> mappedErrors =
        (this?.errors?.map((a) => a?.toString().orEmpty() ?? EMPTY) ??
                const Iterable.empty())
            .cast<String>()
            .toList();

    return UserCart(
      this!.psdata.toDomain(),
      mappedErrors,
    );
  }
}
