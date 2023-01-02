// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CatalogModel {
  static List<Item> items = <Item>[];

  // Get Item by ID
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  // Get Item by position
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;
  int quantity;
  num get totalPrice => price * quantity;
  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
    this.quantity = 1,
  });
  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    int quantity = 1,
    String? image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity ?? 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
      'quantity': quantity,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      price: map['price'],
      color: map['color'],
      image: map['image'],
      quantity: map['quantity'] ?? 1,
    );
  }
}

class SearchMutation extends VxMutation<MyStore> {
  final String query;

  SearchMutation(this.query);
  @override
  perform() {
    if (query.length >= 1) {
      store!.items = CatalogModel.items
          .where((el) => el.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      store!.items = CatalogModel.items;
    }
  }
}

class ChangeQuantity extends VxMutation<MyStore> {
  final Item catalog;
  final int quantity;

  ChangeQuantity(this.catalog, this.quantity);
  @override
  perform() {
    catalog.quantity = quantity;
  }
}
