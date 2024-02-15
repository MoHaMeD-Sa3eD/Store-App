class AllProductsModel {
  final int id;
  final String title;
  final dynamic price;
  final String description;

  final String category;
  final String image;

  // final ProductRating rating;

  AllProductsModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.category,
      // required this.rating
      });

  factory AllProductsModel.fromJson(jsonData) {
    return AllProductsModel(
      id: jsonData["id"],
      title: jsonData["title"],
      price: jsonData["price"],
      description: jsonData["description"],
      image: jsonData['image'],
      category: jsonData["category"],
      /*rating: ProductRating.fromJson(
        jsonData["rating"],
      ),*/
    );
  }
}


/*
class ProductRating {
  final num rate;
  final num count;

  ProductRating({required this.rate, required this.count});

  factory ProductRating.fromJson(json) {
    return ProductRating(
      rate: json["rate"] ,
      count: json["count"],
    );
  }
}
*/
