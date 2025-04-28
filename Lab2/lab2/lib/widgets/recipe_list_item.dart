import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/widgets/recipe_detail.dart';

class RecipeListItem extends StatelessWidget {
  const RecipeListItem(this.recipe, {required this.onTap, super.key});

  final Recipe recipe;
  final void Function() onTap;

@override
Widget build(BuildContext context) {
  return Card(
    child: Container(
      height: 128,
      child: Row(
        children: [
        _image(recipe),
        Expanded(
          child: Column(
            children: [
              Text('Titel'),
              Text(
                recipe.description,
                overflow: TextOverflow.ellipsis, 
                maxLines: 2,
              ),
              Row(children: [Text('Lite mer grejer')]),
            ],
          ),
         ),
       ],
     ),
    ),
  );
}

Widget _image(recipe) {
  return ClipRect(
    child: Container(
      width: 104, // Square width
      height: 104, // Square height
      child: FittedBox(fit: BoxFit.cover, child: recipe.image),
    ),
  );
}

}