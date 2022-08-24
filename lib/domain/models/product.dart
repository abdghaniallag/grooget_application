class ImageSource {
  String src;
  ImageSource(this.src);
}

class Product {
  //model of product informattion
  int id_product;
  int quantity;
  double float_price;
  String price;
  String name;
  String minimal_quantity;
  String cover_image;
  String description;
  String description_short;
  String category_name;
  List<ImageSource?> images;
  Product(
    this.id_product,
    this.quantity,
    this.float_price,
    this.price,
    this.name,
    this.minimal_quantity,
    this.images,
    this.cover_image,
    this.description,
    this.description_short,
    this.category_name,
  );
}

class ProductInformation {
  Product? psdata;
  ProductInformation(this.psdata);
}

class ProductSearch {
  String? label;
  List<Product>? products;
  ProductSearch(this.label, this.products);
}

class ProductSearchList {
  ProductSearch? psdata;
  ProductSearchList(this.psdata);
}
