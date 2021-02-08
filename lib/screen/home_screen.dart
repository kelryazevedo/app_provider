import 'package:app_provider/model/heroDTO.dart';
import 'package:app_provider/screen/hero_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildList() {
    HeroesController heroesController = Provider.of<HeroesController>(context);
    return ListView.builder(
      itemCount: heroesController.heroes.length,
      itemBuilder: (context, index) {
        return _buildItens(heroesController.heroes[index]);
      },
    );
  }

  _buildItens(HeroModel model) {
    HeroesController heroesController = Provider.of<HeroesController>(context);
    return ListTile(
      title: Text(model.nome),
      trailing: model.isFavorite
          ? Icon(
              Icons.star,
              color: Colors.amber,
            )
          : Icon(
              Icons.star_border,
              color: Colors.amber,
            ),
      onTap: () {
        heroesController.checkFavorito(model);
      }, // esse cara já coloca as coisas a direita dos itens
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Utilizando Provider"),
        leading: Consumer<HeroesController>(
            builder: (context, heroController, widget) {
          return Center(
            child: Text(
              "${heroController.heroes.where((_) => _.isFavorite).length}",
              style: TextStyle(fontSize: 18),
            ),
          );
        }),
      ),
      body: Consumer<HeroesController>(
        builder: (context, heroController, widget) {
          return _buildList();
        },
      ),
    );
  }
}
