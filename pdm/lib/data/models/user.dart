import 'package:flutter/cupertino.dart';

class User {
  String? name;
  String? description;
  List<String>? images;
  String? image;

  addImages(url) {
    images!.add(url);
  }

  User(
      {@required this.name,
      @required this.description,
      @required this.images,
      @required this.image});
}
