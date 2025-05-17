import 'dart:convert';
import 'package:collection/collection.dart'; // For DeepCollectionEquality

class Icecreamdata {
  final List<Item> items;

  Icecreamdata({required this.items});

  Icecreamdata copyWith({
    List<Item>? items,
  }) {
    return Icecreamdata(
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory Icecreamdata.fromMap(Map<String, dynamic> map) {
    return Icecreamdata(
      items: List<Item>.from(
        (map['items'] as List<dynamic>).map<Item>(
          (x) => Item.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Icecreamdata.fromJson(String source) =>
      Icecreamdata.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Icecreamdata(items: $items)';

  @override
  bool operator ==(covariant Icecreamdata other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
    return listEquals(other.items, items);
  }

  @override
  int get hashCode => items.hashCode;
}

class Item {
  final String flavour;
  final String description;
  final List<String> toppings;
  final double price;
  final String image;
  final List<Ingredient> ingredients;

  Item({
    required this.flavour,
    required this.description,
    required this.toppings,
    required this.price,
    required this.image,
    required this.ingredients,
  });

  Item copyWith({
    String? flavour,
    String? description,
    List<String>? toppings,
    double? price,
    String? image,
    List<Ingredient>? ingredients,
  }) {
    return Item(
      flavour: flavour ?? this.flavour,
      description: description ?? this.description,
      toppings: toppings ?? this.toppings,
      price: price ?? this.price,
      image: image ?? this.image,
      ingredients: ingredients ?? this.ingredients,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'flavour': flavour,
      'description': description,
      'toppings': toppings,
      'price': price,
      'image': image,
      'ingredients': ingredients.map((x) => x.toMap()).toList(),
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      flavour: map['flavour'] as String,
      description: map['description'] as String,
      toppings: List<String>.from(map['toppings'] as List<dynamic>),
      price: (map['price'] as num).toDouble(),
      image: map['image'] as String,
      ingredients: List<Ingredient>.from(
        (map['ingredients'] as List<dynamic>).map<Ingredient>(
          (x) => Ingredient.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(flavour: $flavour, description: $description, toppings: $toppings, price: $price, image: $image, ingredients: $ingredients)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.flavour == flavour &&
        other.description == description &&
        listEquals(other.toppings, toppings) &&
        other.price == price &&
        other.image == image &&
        listEquals(other.ingredients, ingredients);
  }

  @override
  int get hashCode {
    return flavour.hashCode ^
        description.hashCode ^
        toppings.hashCode ^
        price.hashCode ^
        image.hashCode ^
        ingredients.hashCode;
  }
}

class Ingredient {
  final String type;
  final String name;
  final String quantity;

  Ingredient({
    required this.type,
    required this.name,
    required this.quantity,
  });

  Ingredient copyWith({
    String? type,
    String? name,
    String? quantity,
  }) {
    return Ingredient(
      type: type ?? this.type,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'name': name,
      'quantity': quantity,
    };
  }

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    return Ingredient(
      type: map['type'] as String,
      name: map['name'] as String,
      quantity: map['quantity'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ingredient.fromJson(String source) =>
      Ingredient.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Ingredient(type: $type, name: $name, quantity: $quantity)';

  @override
  bool operator ==(covariant Ingredient other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.name == name &&
        other.quantity == quantity;
  }

  @override
  int get hashCode => type.hashCode ^ name.hashCode ^ quantity.hashCode;
}
