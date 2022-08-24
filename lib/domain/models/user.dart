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
