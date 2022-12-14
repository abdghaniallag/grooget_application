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
  String email;
  String password;
  String firstName;
  String lastName;
  RegisterRequest(
    this.email,
    this.password,
    this.lastName,
    this.firstName,
  );
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
