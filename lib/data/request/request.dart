class LoginRequest {
  String email;
  String password;
  LoginRequest(this.email, this.password);
}

class ForgotPasswordRequest {
  String email;
  ForgotPasswordRequest(this.email);
}

class RegisterRequest {
  String countryMobileCode;
  String userName;
  String email;
  String password;
  String mobile_number;
  String profilePicture;
  RegisterRequest(this.countryMobileCode, this.userName, this.email,
      this.password, this.mobile_number, this.profilePicture);
}

class UpdateCartRequest {
  String? update;
  int? id_product;
  int? id_product_attribute;
  String? op;
  String? action;
  int? qty;
  int? delete;

  UpdateCartRequest({
    this.update,
    this.id_product,
    this.id_product_attribute,
    this.op,
    this.action,
    this.qty,
    this.delete,
  });
}
