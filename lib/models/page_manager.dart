import 'package:flutter/material.dart';

class PageManager{

  PageManager(this._pageController);

  final PageController _pageController;

  int page = 0;

  void setPage(int value){
    if(value == page) return;
    page = value; //o valor de page se torna o da página atual
    _pageController.jumpToPage(value);
  }

}