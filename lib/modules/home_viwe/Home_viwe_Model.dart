import 'dart:math';

import 'package:flutter/material.dart';
import 'package:naws_app/core/api/Network/Api_network.dart';
import 'package:naws_app/core/api/article_model.dart';
import 'package:naws_app/core/api/source_model.dart';
import 'package:naws_app/core/models/catagory_widget.dart';
import 'dart:developer';

/// crate provider for category extends from ChangeNotifier
class Home_viwe extends ChangeNotifier {
  int currentIndex = 0;
  catgory_widget? _salecteditem; // null
  List <Source> _sourcesList = [];
  List <Article> _articlesList = [];
  List<catgory_widget> _catgoryList = [
    catgory_widget(catgoryId: "General", catgoryname: "General", catgoryIamge: "assets/images/Frame 10.png"),
    catgory_widget(catgoryId: "Business", catgoryname: "Business", catgoryIamge: "assets/images/Frame 11.png"),
    catgory_widget(catgoryId: "Sports", catgoryname: "Sports", catgoryIamge: "assets/images/Frame 12.png"),
    catgory_widget(catgoryId: "Health", catgoryname: "Health", catgoryIamge: "assets/images/Frame 12 (1).png"),
  ];
  /// make a getter for salecteditem
  catgory_widget? get salecteditem => _salecteditem;
  List <Article> get articlesList => _articlesList;
  List <Source> get sourcesList => _sourcesList;

  List<catgory_widget> get catgoryList => _catgoryList;
  void oncategreycliced(catgory_widget catgory){
      _salecteditem = catgory;
      notifyListeners();
  }
  void goHome(){
    _salecteditem = null;
    notifyListeners();
  }
  Future<void> gatAllSources()async{
    /// here i sand _salecteditem and gat from he catgoryId of index
    _sourcesList  =  await Api_network.gatAllSouces(
      _salecteditem!.catgoryId,

    );
    notifyListeners();
  }
  Future<void> gatAllArticals()async{
    /// here i sand _salecteditem and gat from he catgoryId of index
    _articlesList  =  await Api_network.gatAllArticels(
      _sourcesList[currentIndex].id,
    );
    notifyListeners();
  }
   void satSelctedsourse(int insdex){
  currentIndex = insdex;
  gatAllArticals();
  notifyListeners();
}

}