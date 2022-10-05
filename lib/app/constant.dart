class Constants {
  static const String baseUrl = "https://www.grooget.com/rest";
  static const String baseUrlApiLink = "/rest";
  static String token = '';
  static const List<List<String>> categoryTree = [
    ["Shirts", "Clothing", "Men", "Home"],
    ["Tshirts & Tank", "Clothing", "Men", "Home"],
    ["Polo Shirts", "Clothing", "Men", "Home"],
    ["Formal Wear", "Clothing", "Men", "Home"],
    ["Shorts", "Clothing", "Men", "Home"],
    ["Swimwear", "Clothing", "Men", "Home"],
    ["Jackets & Coats", "Clothing", "Men", "Home"],
    ["Hoodies & Sweatshirts", "Clothing", "Men", "Home"],
    ["Traditional Wear", "Clothing", "Men", "Home"],
    ["Sweaters & Cardigan", "Clothing", "Men", "Home"],
    ["Underwear", "Clothing", "Men", "Home"],
    ["Jeans", "Clothing", "Men", "Home"],
    ["Trousers", "Clothing", "Men", "Home"],
    ["sweatpants", "Clothing", "Men", "Home"],
    ["Sportswear", "Clothing", "Men", "Home"],
    ["Socks", "Clothing", "Men", "Home"],
    ["Pyjamas", "Clothing", "Men", "Home"],
    ["Sports Shoes", "Footwear", "Men", "Home"],
    ["Sneakers", "Footwear", "Men", "Home"],
    ["Sandal", "Footwear", "Men", "Home"],
    ["Boots", "Footwear", "Men", "Home"],
    ["Formal shoes", "Footwear", "Men", "Home"],
    ["Flip Flops", "Footwear", "Men", "Home"],
    ["Slippers", "Footwear", "Men", "Home"],
    ["Backpacks", "Accessories", "Men", "Home"],
    ["Briefcases", "Accessories", "Men", "Home"],
    ["Laptop Bags & Cases", "Accessories", "Men", "Home"],
    ["Gym Bags", "Accessories", "Men", "Home"],
    ["Wallets & card cases", "Accessories", "Men", "Home"],
    ["Hats", "Accessories", "Men", "Home"],
    ["Belts", "Accessories", "Men", "Home"],
    ["Scarves", " Berets & Gloves", "Accessories", "Men", "Home"],
    ["Scarf & Tie", "Accessories", "Men", "Home"],
    ["Abayas", "Clothing", "Women", "Home"],
    ["Dresses", "Clothing", "Women", "Home"],
    ["Jalabiyas", "Clothing", "Women", "Home"],
    ["Swimwear", "Clothing", "Women", "Home"],
    ["Jeans", "Clothing", "Women", "Home"],
    ["Trousers", "Clothing", "Women", "Home"],
    ["sweatpants", "Clothing", "Women", "Home"],
    ["Jackets & Coats", "Clothing", "Women", "Home"],
    ["Hoodies and Sweatshirts", "Clothing", "Women", "Home"],
    ["T-shirts", "Clothing", "Women", "Home"],
    ["Jumpsuit", "Clothing", "Women", "Home"],
    ["Skirts", "Clothing", "Women", "Home"],
    ["Sport's Wear", "Clothing", "Women", "Home"],
    ["Shorts", "Clothing", "Women", "Home"],
    ["Underwear", "Clothing", "Women", "Home"],
    ["Sweater & Cardigan", "Clothing", "Women", "Home"],
    ["Skinny pants", "Clothing", "Women", "Home"],
    ["Crop Tops", "Clothing", "Women", "Home"],
    ["Pregnancy clothes", "Clothing", "Women", "Home"],
    ["Socks", "Clothing", "Women", "Home"],
    ["Pyjamas", "Clothing", "Women", "Home"],
    ["Sets", "Clothing", "Women", "Home"],
    ["Shirts", "Clothing", "Women", "Home"],
    ["Suits Classic", "Clothing", "Women", "Home"],
    ["Sneackers", "Footwear", "Women", "Home"],
    ["Sport Shoes", "Footwear", "Women", "Home"],
    ["Sandals", "Footwear", "Women", "Home"],
    ["Flats", "Footwear", "Women", "Home"],
    ["Wide shoes", "Footwear", "Women", "Home"],
    ["Slippers", "Footwear", "Women", "Home"],
    ["High Heels", "Footwear", "Women", "Home"],
    ["Boots", "Footwear", "Women", "Home"],
    ["Caps", "Accessories", "Women", "Home"],
    ["Belts", "Accessories", "Women", "Home"],
    ["Scarves", " Berets & Gloves", "Accessories", "Women", "Home"],
    ["Veil", "Accessories", "Women", "Home"],
    ["Backpacks", "Bags and wallets", "Women", "Home"],
    ["Shoulder bags", "Bags and wallets", "Women", "Home"],
    ["Club bags", "Bags and wallets", "Women", "Home"],
    ["Cards wallets", "Bags and wallets", "Women", "Home"],
    ["Hand Bag", "Bags and wallets", "Women", "Home"],
    ["Shirts", "Clothing", "Boys", "Home"],
    ["Tshirts & Tank", "Clothing", "Boys", "Home"],
    ["Polo Shirts", "Clothing", "Boys", "Home"],
    ["Formal Wear", "Clothing", "Boys", "Home"],
    ["Shorts", "Clothing", "Boys", "Home"],
    ["Swimwear", "Clothing", "Boys", "Home"],
    ["Jackets & Coats", "Clothing", "Boys", "Home"],
    ["Hoodies & Sweatshirts", "Clothing", "Boys", "Home"],
    ["Traditional Wear", "Clothing", "Boys", "Home"],
    ["Sweaters & Cardigan", "Clothing", "Boys", "Home"],
    ["Underwear", "Clothing", "Boys", "Home"],
    ["Jeans", "Clothing", "Boys", "Home"],
    ["Trousers", "Clothing", "Boys", "Home"],
    ["sweatpants", "Clothing", "Boys", "Home"],
    ["Sportswear", "Clothing", "Boys", "Home"],
    ["Socks", "Clothing", "Boys", "Home"],
    ["Pyjamas", "Clothing", "Boys", "Home"],
    ["Set", "Clothing", "Boys", "Home"],
    ["Sports Shoes", "Footwear", "Boys", "Home"],
    ["Sneakers", "Footwear", "Boys", "Home"],
    ["Sandal", "Footwear", "Boys", "Home"],
    ["Boots", "Footwear", "Boys", "Home"],
    ["Formal", "Footwear", "Boys", "Home"],
    ["Flip Flops", "Footwear", "Boys", "Home"],
    ["Slippers", "Footwear", "Boys", "Home"],
    ["Backpacks", "Accessories", "Boys", "Home"],
    ["Wallets & card cases", "Accessories", "Boys", "Home"],
    ["Hats", "Accessories", "Boys", "Home"],
    ["Belts", "Accessories", "Boys", "Home"],
    ["Scarves", " Berets & Gloves", "Accessories", "Boys", "Home"],
    ["Scarf & Tie", "Accessories", "Boys", "Home"],
    ["Dresses", "Clothing", "Girls", "Home"],
    ["Sweatshirts", "Clothing", "Girls", "Home"],
    ["Swimwear", "Clothing", "Girls", "Home"],
    ["Jeans", "Clothing", "Girls", "Home"],
    ["Trousers", "Clothing", "Girls", "Home"],
    ["Sweatpants", "Clothing", "Girls", "Home"],
    ["Jackets", "Clothing", "Girls", "Home"],
    ["Hoodies and sweatshirts", "Clothing", "Girls", "Home"],
    ["T-shirts", "Clothing", "Girls", "Home"],
    ["Jumpsuit", "Clothing", "Girls", "Home"],
    ["Skirts", "Clothing", "Girls", "Home"],
    ["sports' wear", "Clothing", "Girls", "Home"],
    ["Shorts", "Clothing", "Girls", "Home"],
    ["underwear", "Clothing", "Girls", "Home"],
    ["Sweater and Cardigan", "Clothing", "Girls", "Home"],
    ["Skinny pants", "Clothing", "Girls", "Home"],
    ["tops", "Clothing", "Girls", "Home"],
    ["Socks", "Clothing", "Girls", "Home"],
    ["Pyjamas", "Clothing", "Girls", "Home"],
    ["Set", "Clothing", "Girls", "Home"],
    ["Snickers", "Footwear", "Girls", "Home"],
    ["sport shoes", "Footwear", "Girls", "Home"],
    ["sandals", "Footwear", "Girls", "Home"],
    ["Flat", "Footwear", "Girls", "Home"],
    ["Wide shoes", "Footwear", "Girls", "Home"],
    ["Slippers", "Footwear", "Girls", "Home"],
    ["heel", "Footwear", "Girls", "Home"],
    ["High boots", "Footwear", "Girls", "Home"],
    ["Caps", "Accessories", "Girls", "Home"],
    ["Belts", "Accessories", "Girls", "Home"],
    ["Scarves", " Berets & Gloves", "Accessories", "Girls", "Home"],
    ["Backpacks", "Accessories", "Girls", "Home"],
    ["Shoulder bags", "Accessories", "Girls", "Home"],
    ["Cards wallets", "Accessories", "Girls", "Home"],
    ["Newborn (0-24)", "Clothing", "Baby Boys", "Home"],
    ["Sets", "Clothing", "Baby Boys", "Home"],
    ["Shirts", "Clothing", "Baby Boys", "Home"],
    ["Tshirts", "Clothing", "Baby Boys", "Home"],
    ["Polo", "Clothing", "Baby Boys", "Home"],
    ["Formal Wear", "Clothing", "Baby Boys", "Home"],
    ["Shorts", "Clothing", "Baby Boys", "Home"],
    ["Swimwear", "Clothing", "Baby Boys", "Home"],
    ["Jackets & Coats", "Clothing", "Baby Boys", "Home"],
    ["Hoodies & Sweatshirts", "Clothing", "Baby Boys", "Home"],
    ["Traditional Wear", "Clothing", "Baby Boys", "Home"],
    ["Sweaters & Cardigan", "Clothing", "Baby Boys", "Home"],
    ["Underwear", "Clothing", "Baby Boys", "Home"],
    ["Jeans", "Clothing", "Baby Boys", "Home"],
    ["Trousers", "Clothing", "Baby Boys", "Home"],
    ["Sweatpants", "Clothing", "Baby Boys", "Home"],
    ["Sport's Wear", "Clothing", "Baby Boys", "Home"],
    ["Socks", "Clothing", "Baby Boys", "Home"],
    ["Pyjamas", "Clothing", "Baby Boys", "Home"],
    ["Tracksuit Bottom", "Clothing", "Baby Boys", "Home"],
    ["Onesies", "Clothing", "Baby Boys", "Home"],
    ["Sport's Shoes", "Footwear", "Baby Boys", "Home"],
    ["Sneakers", "Footwear", "Baby Boys", "Home"],
    ["Sandal", "Footwear", "Baby Boys", "Home"],
    ["Boots", "Footwear", "Baby Boys", "Home"],
    ["Formal", "Footwear", "Baby Boys", "Home"],
    ["Flip Flops", "Footwear", "Baby Boys", "Home"],
    ["Slipper", "Footwear", "Baby Boys", "Home"],
    ["Backpacks", "Accessories", "Baby Boys", "Home"],
    ["Wallets & card cases", "Accessories", "Baby Boys", "Home"],
    ["Hats", "Accessories", "Baby Boys", "Home"],
    ["Belts", "Accessories", "Baby Boys", "Home"],
    ["Scarves", " Berets & Gloves", "Accessories", "Baby Boys", "Home"],
    ["Scarf & Tie", "Accessories", "Baby Boys", "Home"],
    ["Newborn (0-24)", "Clothing", "Baby Girls", "Home"],
    ["Set", "Clothing", "Baby Girls", "Home"],
    ["Dresses", "Clothing", "Baby Girls", "Home"],
    ["Sweatshirts", "Clothing", "Baby Girls", "Home"],
    ["Swimwear", "Clothing", "Baby Girls", "Home"],
    ["Jeans", "Clothing", "Baby Girls", "Home"],
    ["Trousers", "Clothing", "Baby Girls", "Home"],
    ["Sweatpants", "Clothing", "Baby Girls", "Home"],
    ["Jackets", "Clothing", "Baby Girls", "Home"],
    ["Hoodies and sweatshirts", "Clothing", "Baby Girls", "Home"],
    ["T-shirts", "Clothing", "Baby Girls", "Home"],
    ["Jumpsuit", "Clothing", "Baby Girls", "Home"],
    ["Skirts", "Clothing", "Baby Girls", "Home"],
    ["Sports' wear", "Clothing", "Baby Girls", "Home"],
    ["Shorts", "Clothing", "Baby Girls", "Home"],
    ["Underwear", "Clothing", "Baby Girls", "Home"],
    ["Sweater and Cardigan", "Clothing", "Baby Girls", "Home"],
    ["Skinny pants", "Clothing", "Baby Girls", "Home"],
    ["Tops", "Clothing", "Baby Girls", "Home"],
    ["Socke", "Clothing", "Baby Girls", "Home"],
    ["Pyjamas", "Clothing", "Baby Girls", "Home"],
    ["Tracksuit Bottom", "Clothing", "Baby Girls", "Home"],
    ["Onesies", "Clothing", "Baby Girls", "Home"],
    ["Sneackers", "Clothing", "Baby Girls", "Home"],
    ["sport's Shoes", "Clothing", "Baby Girls", "Home"],
    ["Sandals", "Clothing", "Baby Girls", "Home"],
    ["Flat", "Clothing", "Baby Girls", "Home"],
    ["Wide shoes", "Clothing", "Baby Girls", "Home"],
    ["Slippers", "Clothing", "Baby Girls", "Home"],
    ["High boots", "Clothing", "Baby Girls", "Home"],
    ["Caps", "Accessories", "Baby Girls", "Home"],
    ["Belts", "Accessories", "Baby Girls", "Home"],
    ["Scarves", " Berets & Gloves", "Accessories", "Baby Girls", "Home"],
    ["Backpacks", "Accessories", "Baby Girls", "Home"],
    ["Shoulder bags", "Accessories", "Baby Girls", "Home"],
    ["Cards wallets", "Accessories", "Baby Girls", "Home"],
    ["", "Carpets", "Textile", "Home"],
    ["", "Window blinds", "Textile", "Home"],
    ["", "Bedding and room essentials", "Textile", "Home"],
    ["", "Bathroom accessories", "Textile", "Home"]
  ];
  static List<Map<int, String>> mainCategoris = [
    {10: "Men"},
    {48: "Women"},
    {91: "Boys"},
    {125: "Girls"},
    {162: "Baby Boys"},
    {199: "Baby Girls"},
    {238: "Textile"},
  ];

  static const Map<String, String> categoryImages = {
    'Men': 'https://www.grooget.com/c/48-category_default/women.jpg',
    'Women': 'https://www.grooget.com/c/91-category_default/boys.jpg',
    'Boys': 'https://www.grooget.com/c/125-category_default/girls.jpg',
    'Girls': 'https://www.grooget.com/c/10-category_default/-.jpg',
    'Baby Boys': 'https://www.grooget.com/c/162-category_default/baby-boys.jpg',
    'Baby Girls':
        'https://www.grooget.com/c/199-category_default/baby-girls.jpg',
    'Textile': 'https://www.grooget.com/c/238-category_default/textile.jpg'
  };

  static const Map<String, String> bannarImages = {
    'sell-on-grroget':
        'https://www.grooget.com/modules/jscomposer/uploads/grooget%20services/sell-on-grroget.jpeg',
    'median and product control':
        'https://www.grooget.com/modules/jscomposer/uploads/grooget%20services/responsi.jpeg',
    'Pay bills and money transfer':
        'https://www.grooget.com/modules/jscomposer/uploads/grooget%20services/mony.jpeg',
    'Shipping worldwide GROOGET CARGO':
        'https://www.grooget.com/modules/jscomposer/uploads/grooget%20services/shipping-.jpeg',
  };
}
