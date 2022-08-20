class SliderObject {
  String title;
  String subTitle;
  String image;
  SliderObject(this.title, this.subTitle, this.image);
}

class Customer {
  // model user information
  String id;
  String id_shop;
  String id_shop_group;
  String id_gender;
  String id_lang;
  String lastname;
  String firstname;
  String birthday;
  String email;
  String newsletter;
  int logged;
  String active;
  Customer(
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
}

class CustomerAcountInformation {
  //model of user acount information response
  int id;
  String id_shop;
  String id_shop_group;
  String id_gender;
  String id_lang;
  String lastname;
  String firstname;
  String birthday;
  String email;
  String newsletter;
  bool logged;
  String active;
  CustomerAcountInformation(
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
}

class PrestashopLogin {
  String? status;
  String? message;
  String? customer_id;
  int? session_data;
  int? cart_count;
  Customer? user;
  PrestashopLogin(this.status, this.message, this.customer_id,
      this.session_data, this.cart_count, this.user);
}

class Authentication {
  PrestashopLogin? psdata;
  Authentication(this.psdata);
}

class AcountInformation {
  CustomerAcountInformation? psdata;
  AcountInformation(this.psdata);
}

class ProductInformation {
  //model of product informattion
  int id;
  int quantity;
  double float_price;
  String id_shop;
  String id_shop_group;
  String id_gender;
  String id_lang;
  String price;
  String name;
  String birthday;
  String email;
  String newsletter;
  bool logged;
  String active;
  ProductInformation(
    this.id,
    this.quantity,
    this.float_price,
    this.id_shop,
    this.id_shop_group,
    this.id_gender,
    this.id_lang,
    this.price,
    this.name,
    this.birthday,
    this.email,
    this.newsletter,
    this.logged,
    this.active,
  );
}

class Service {
  int id;
  String title;
  String image;
  Service(this.id, this.title, this.image);
}

class Stores {
  int id;
  String title;
  String image;
  Stores(this.id, this.title, this.image);
}

class BannerAd {
  int id;
  String title;
  String image;
  String link;
  BannerAd(this.id, this.title, this.image, this.link);
}

class HomeData {
  List<Service> services;
  List<Stores> stores;
  List<BannerAd> banners;
  HomeData(this.services, this.stores, this.banners);
}

class HomeObject {
  HomeData homeData;
  HomeObject(this.homeData);
}

class ImageSource {
  String src;
  ImageSource(this.src);
}

class ImagePrestashop {
  List<ImageSource> image;
  ImagePrestashop(this.image);
}
