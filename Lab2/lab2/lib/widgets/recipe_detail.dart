import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/ui_controller.dart';
import 'package:provider/provider.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  @override
Widget build(BuildContext context) {
  var uiController = Provider.of<UIController>(context, listen: false);

  return Container(
      width: 800,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      // The recipe image
      IconButton(
        icon: const Icon(Icons.close, color: Color.fromARGB(255, 0, 0, 0)),
        onPressed: () {
          uiController.deselectRecipe();
        },
      ),
      SizedBox(
        width: 300,
        height: 300,
        child: recipe.image,
      ),
      Text(recipe.name),
      Text(recipe.description),
    ],
  )
  );
}
}