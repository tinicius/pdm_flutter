import 'package:flutter/material.dart';
import 'package:pdm/data/models/user.dart';

class PerfilPageController {
  TabController? tabController;

  Size? _size;

  final String url = "";

  initTabController({length, vsync}) {
    tabController = TabController(length: length, vsync: vsync);
  }

  set size(value) {
    this.size = value;
  }

  Size get size => this.size;
}
