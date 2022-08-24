// to convert responses to non nullable objects (model)
import '../../data/responses/responses.dart';
import '../../domain/models/user.dart';
import '../../app/extentions.dart';

const EMPTY = "";
const EMPTY_LIST = [];
const ZERO = 0;
const DZERO = 0.0;
const FALSE = false;

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      this?.id?.orEmpty() ?? EMPTY,
      this?.id_shop?.orEmpty() ?? EMPTY,
      this?.id_shop_group?.orEmpty() ?? EMPTY,
      this?.id_gender?.orEmpty() ?? EMPTY,
      this?.id_lang?.orEmpty() ?? EMPTY,
      this?.lastname?.orEmpty() ?? EMPTY,
      this?.firstname?.orEmpty() ?? EMPTY,
      this?.birthday?.orEmpty() ?? EMPTY,
      this?.email?.orEmpty() ?? EMPTY,
      this?.newsletter?.orEmpty() ?? EMPTY,
      this?.logged?.orEmpty() ?? ZERO,
      this?.active?.orEmpty() ?? EMPTY,
    );
  }
}

extension CustomerAcountInformationResponseMapper
    on CustomerAcountInformationResponse? {
  CustomerAcountInformation toDomain() {
    return CustomerAcountInformation(
      this?.id?.orEmpty() ?? ZERO,
      this?.id_shop?.orEmpty() ?? EMPTY,
      this?.id_shop_group?.orEmpty() ?? EMPTY,
      this?.id_gender?.orEmpty() ?? EMPTY,
      this?.id_lang?.orEmpty() ?? EMPTY,
      this?.lastname?.orEmpty() ?? EMPTY,
      this?.firstname?.orEmpty() ?? EMPTY,
      this?.birthday?.orEmpty() ?? EMPTY,
      this?.email?.orEmpty() ?? EMPTY,
      this?.newsletter?.orEmpty() ?? EMPTY,
      this?.logged?.orEmpty() ?? FALSE,
      this?.active?.orEmpty() ?? EMPTY,
    );
  }
}

extension PrestashopLoginResponsMapper on PrestashopLoginRespons? {
  PrestashopLogin toDomain() {
    return PrestashopLogin(
        this?.status?.orEmpty() ?? EMPTY,
        this?.message?.orEmpty() ?? EMPTY,
        this?.customer_id?.orEmpty() ?? EMPTY,
        this?.session_data?.orEmpty() ?? ZERO,
        this?.cart_count?.orEmpty() ?? ZERO,
        this?.user?.toDomain());
  }
}

extension AuthenticationResponsMapper on AuthenticationRespons? {
  Authentication toDomain() {
    return Authentication(this?.psdata?.toDomain());
  }
}

extension AcountInformationResponsMapper on AcountInformationResponse? {
  AcountInformation toDomain() {
    return AcountInformation(this?.psdata?.toDomain());
  }
}

extension ForgotPasswordResponseMapper on ForgotPasswordResponse? {
  String toDomain() {
    return this?.support?.orEmpty() ?? EMPTY;
  }
}
