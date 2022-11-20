class Total {
  String type;
  String label;
  double amount;
  String value;
  Total(this.type, this.label, this.amount, this.value);
}

class Totals {
  Total? total;
  Total? total_including_tax;
  Total? total_excluding_tax;
  Totals(this.total, this.total_including_tax, this.total_excluding_tax);
}

class Subtotals {
  Total? products;
  Total? shipping;
  Total? tax;
  Subtotals(this.products, this.shipping, this.tax);
}

class Labels {
  String tax_short;
  String tax_long;
  Labels(this.tax_short, this.tax_long);
}

class Vouchers {
  int allowed;
  List<dynamic>? added;
  Vouchers(this.allowed, this.added);
}

class Product {
  String id_product_attribute;
  String id_product;
  String cart_quantity;
  String id_shop;
  String name;
  String description_short;
  String id_category_default;
  double price;
  String date_add;
  String date_upd;
  int quantity;
  dynamic total;
  dynamic total_wt;
  dynamic price_wt;
  String attributes_small;
  dynamic price_with_reduction_without_tax;
  String image_url;
  String reference;
  Product(
    this.id_product_attribute,
    this.id_product,
    this.cart_quantity,
    this.id_shop,
    this.name,
    this.description_short,
    this.id_category_default,
    this.price,
    this.date_add,
    this.date_upd,
    this.quantity,
    this.total,
    this.total_wt,
    this.price_wt,
    this.attributes_small,
    this.price_with_reduction_without_tax,
    this.image_url,
    this.reference,
  );
}

class Cart {
  Totals? totals;
  Totals? subtotals;
  int products_count;
  Labels? labels;
  Vouchers? vouchers;
  List<Product?>? products;
  Cart(this.totals, this.subtotals, this.products_count, this.labels,
      this.vouchers, this.products);
}

class UserCart {
  Cart? psdata;

  List<String>? errors;
  UserCart(this.psdata, this.errors);
}
