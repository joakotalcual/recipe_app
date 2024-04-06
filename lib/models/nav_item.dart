
import 'package:flutter/material.dart';

class NavItem {
  final int id = 0;
  final String icon = '';
  final Widget destination = const SizedBox();

  NavItem({required id, required icon, required destination});

  //Si no existe el destino, entonces nos ayuda.
  bool destinationChecker() {
    // ignore: unnecessary_null_comparison
    if(destination != null){
      return true;
    }
    return false;
  }
}