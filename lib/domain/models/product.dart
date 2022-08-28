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
    this.cover_image,
    this.description,
    this.description_short,
    this.category_name,
    this.images,
  );
}

class ProductInformation {
  Product? psdata;
  ProductInformation(this.psdata);
}

//----------------- search product objects ---------------------------------------------

class Cover {
  String url;
  int width;
  int height;
  Cover(this.url, this.width, this.height);
}

class ProductItem {
  //model of product when the request is search for product informattion
  String id_product;
  String price;
  String name;
  Cover? cover;
  String description;
  String description_short;
  String category_name;
  ProductItem(
    this.id_product,
    this.price,
    this.name,
    this.cover,
    this.description,
    this.description_short,
    this.category_name,
  );
}

class ProductSearch {
  String? label;
  List<ProductItem>? products;
  ProductSearch(this.label, this.products);
}

class ProductSearchList {
  ProductSearch? psdata;
  ProductSearchList(this.psdata);
}
