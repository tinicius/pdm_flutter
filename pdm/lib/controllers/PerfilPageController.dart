import 'package:flutter/material.dart';
import 'package:pdm/data/models/user.dart';

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
