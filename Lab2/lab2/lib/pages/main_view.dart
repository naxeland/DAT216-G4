import 'package:flutter/material.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/ingredient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/logo.dart';
import 'package:lab2/widgets/price_control.dart';
import 'package:lab2/widgets/recipe_area.dart';
import 'package:lab2/widgets/recipe_detail.dart';
import 'package:lab2/widgets/recipe_list.dart';
import 'package:lab2/widgets/time_control.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _controlPanel(context),
          const Expanded(
            child: RecipeArea(),
          ),
        ],
      ),
    );
  }

Widget _controlPanel(context, {double width = 320}) {
   return Container(
      width: width,
      color: const Color.fromARGB(255, 193, 210, 218),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Center(
          child: Logo(),
        ),
        Text('Hitta ett recept som passar genom att ändra inställningarna nedanför'),
        SizedBox(height: 8),
        IngredientControl(),
        KitchenControl(),
            Center(
          child: Text('Svårighetsgrad'),
        ),
        DifficulyControl(),
        Center(
          child: Text('Maxpris'),
        ),
        PriceControl(),
        SizedBox(height: 30),
        Center(
          child: Text('Maxtid'),
        ),
        TimeControl()
      ],
    ),
   );
}
}