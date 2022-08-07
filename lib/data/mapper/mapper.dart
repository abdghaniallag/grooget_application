// to convert responses to non nullable objects (model)
import 'package:mvvm_first_c/data/responses/responses.dart';
import 'package:mvvm_first_c/domain/model.dart';
import 'package:mvvm_first_c/app/extentions.dart';

const EMPTY = "";
const ZERO = 0;

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

extension ForgotPasswordResponseMapper on ForgotPasswordResponse? {
  String toDomain() {
    return this?.support?.orEmpty() ?? EMPTY;
  }
}

extension ServiceResponseMapper on ServiceResponse? {
  Service toDomain() {
    return Service(this?.id?.orEmpty() ?? ZERO, this?.title?.orEmpty() ?? EMPTY,
        this?.image?.orEmpty() ?? EMPTY);
  }
}

extension StoresResponseMapper on StoresResponse? {
  Stores toDomain() {
    return Stores(this?.id?.orEmpty() ?? ZERO, this?.title?.orEmpty() ?? EMPTY,
        this?.image?.orEmpty() ?? EMPTY);
  }
}

extension BannersResponseMapper on BannersResponse? {
  BannerAd toDomain() {
    return BannerAd(
        this?.id?.orEmpty() ?? ZERO,
        this?.title?.orEmpty() ?? EMPTY,
        this?.image?.orEmpty() ?? EMPTY,
        this?.link?.orEmpty() ?? EMPTY);
  }
}

extension HomePageResponseMapper on HomeResponse? {
  HomeObject toDomain() {
    List<Service> MappedServices =
        (this?.homeData?.services?.map((services) => services.toDomain()) ??
                Iterable.empty())
            .cast<Service>()
            .toList();
    List<Stores> MappedStores =
        (this?.homeData?.stores?.map((stores) => stores.toDomain()) ??
                Iterable.empty())
            .cast<Stores>()
            .toList();
    List<BannerAd> MappedBanners =
        (this?.homeData?.banners?.map((banners) => banners.toDomain()) ??
                Iterable.empty())
            .cast<BannerAd>()
            .toList();

    var data = HomeData(MappedServices, MappedStores, MappedBanners);
    return HomeObject(data);
  }
}
