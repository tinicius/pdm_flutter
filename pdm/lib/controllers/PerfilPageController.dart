import 'package:flutter/material.dart';

class PerfilPageController {
  TabController? tabController;

  Size? _size;
  //Colo

  final String url = "";

  initTabController({length, vsync}) {
    tabController = TabController(length: length, vsync: vsync);
  }

  set size(value) {
    _size = value;
  }

  Size get size => _size!;
}
