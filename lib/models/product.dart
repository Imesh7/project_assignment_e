
import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    Product({
        required this.status,
        required this.result,
    });

    bool? status;
    List<Result>? result;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        status: json["status"],
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.id,
        this.name,
        this.category,
        this.brand,
        this.model,
        this.price,
        this.colour,
        this.weight,
        this.image,
    });

    String? id;
    String? name;
    String? category;
    String? brand;
    String? model;
    double? price;
    String? colour;
    String? weight;
    String? image;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        brand: json["brand"],
        model: json["model"],
        price: json["price"],
        colour: json["colour"],
        weight: json["weight"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "brand": brand,
        "model": model,
        "price": price,
        "colour": colour,
        "weight": weight,
        "image": image,
    };
}
