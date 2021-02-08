import 'package:app_provider/model/heroDTO.dart';
import 'package:flutter/cupertino.dart';

class HeroesController extends ChangeNotifier{

  //a ideia é recuperar isso em qualquer lugar do app
  List<HeroModel> heroes = [

    HeroModel(nome: "Thor"),
    HeroModel(nome: "Iron Man"),
    HeroModel(nome: "Batman"),
    HeroModel(nome: "Wonder Woman"),
    HeroModel(nome: "Capitan America"),

  ];

  checkFavorito(HeroModel model){
    model.isFavorite = !model.isFavorite;
    notifyListeners();
  }

}

