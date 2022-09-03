class ImageSource {
  String src;
  ImageSource(this.src);
}

class CombinationsItem {
  int id_product_attribute;
  int quantity;
  String price;
  double float_price;
  int minimal_quantity;
  String combination_code;
  CombinationsItem(this.id_product_attribute, this.quantity, this.price,
      this.float_price, this.combination_code, this.minimal_quantity);
}

class OptionItem {
  int id;
  String value;
  String hex_value;
  OptionItem(this.id, this.value, this.hex_value);
}

class Option {
  int id;
  String title;
  int is_color_option;
  List<OptionItem?> items;
  Option(this.id, this.title, this.is_color_option, this.items);
}

class ProductInfoItem {
  String name;
  String value;
  ProductInfoItem(this.name, this.value);
}

class Product {
  //model of product informattion
  int id_product;
  int quantity;
  double float_price;
  String price;
  String available_for_order;
  String name;
  String minimal_quantity;
  String cover_image;
  String description;
  String description_short;
  String category_name;
  String reference;
  List<CombinationsItem?> combinations;
  List<Option?> options;
  List<ImageSource?> images;
  List<ProductInfoItem?> product_info;
  Product(
    this.id_product,
    this.quantity,
    this.float_price,
    this.price,
    this.available_for_order,
    this.name,
    this.minimal_quantity,
    this.cover_image,
    this.description,
    this.description_short,
    this.category_name,
    this.reference,
    this.combinations,
    this.options,
    this.images,
    this.product_info,
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

//-------------------------- category models ----------------------------

class CategoryImageSource {
  String? url;
  int? width;
  int? height;
  CategoryImageSource(this.url, this.width, this.height);
}

class CategoryImage {
  CategoryImageSource? small;
  CategoryImageSource? medium;
  CategoryImageSource? large;
  CategoryImage(this.small, this.medium, this.large);
}

class CategoryProductItem {
  String id_product;
  String price;
  String name;
  CategoryImage? cover;
  String description;
  String description_short;
  String category_name;
  CategoryProductItem(
    this.id_product,
    this.price,
    this.name,
    this.cover,
    this.description,
    this.description_short,
    this.category_name,
  );
}

class SortOrder {
  String entity;
  String field;
  String direction;
  String label;
  String urlParameter;
  bool current;

  SortOrder(this.entity, this.field, this.direction, this.label,
      this.urlParameter, this.current);
}

class Pagination {
  int total_items;
  int items_shown_from;
  int items_shown_to;
  int current_page;
  int pages_count;

  Pagination(this.total_items, this.items_shown_from, this.items_shown_to,
      this.current_page, this.pages_count);
}

class Property {
  String color = "";
  String symbol = "";
  int min = 0;
  int max = 20000;
  Property({
    this.color = "",
    this.symbol = "",
    this.min = 0,
    this.max = 20000,
  });
}

class Filters {
  String label;
  String type;
  int active;
  int displayed;
  int magnitude;
  dynamic value;
  Property? properties;
  Filters(this.label, this.type, this.active, this.displayed, this.magnitude,
      this.value, this.properties);
}

class Facets {
  String label;
  bool displayed;
  String type;
  bool multipleSelectionAllowed;
  String widgetType;
  List<Filters> filters;
  Facets(this.label, this.displayed, this.type, this.multipleSelectionAllowed,
      this.widgetType, this.filters);
}

class Category {
  String description;
  String active;
  CategoryImage? images;
  String label;
  Pagination? pagination;
  List<CategoryProductItem?>? products;
  List<SortOrder?>? sort_orders;
  List<Facets?>? facets;
  Category(
    this.description,
    this.active,
    this.images,
    this.label,
    this.pagination,
    this.products,
    this.sort_orders,
    this.facets,
  );
}

class CategoryList {
  Category? psdata;
  CategoryList(this.psdata);
}
