import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/util/main_ingredient.dart';
import 'package:lab2/widgets/recipe_detail.dart';
import 'package:lab2/widgets/time_control.dart';
import 'package:lab2/constants/assets.dart';


class RecipeListItem extends StatelessWidget {
  const RecipeListItem(this.recipe, {required this.onTap, super.key});

  final Recipe recipe;
  final void Function() onTap;

@override
Widget build(BuildContext context) {
  return Card(
  elevation: 4,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  child: InkWell( // Nytt
    borderRadius: BorderRadius.circular(12),
    splashColor: Colors.blue.withAlpha(30),
    onTap: onTap,
    child: Container(
      height: 128,
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              _image(recipe),
              Positioned(
                bottom: 4,
                right: 4,
                child: Cuisine.flag(recipe.cuisine, width: 15)!,
              ),
            ],
          ),
          SizedBox(width: AppTheme.paddingMedium),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  recipe.name,
                  style: AppTheme.mediumHeading,
                ),
                Text(
                  recipe.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    MainIngredient.icon(recipe.mainIngredient, width: 15)!,
                    SizedBox(width: AppTheme.paddingMedium),
                    Difficulty.icon(recipe.difficulty, width: 28)!,
                    SizedBox(width: AppTheme.paddingMedium),
                    Image.asset(Assets.timeIcon, height: 16.0),
                    SizedBox(width: AppTheme.paddingMedium),
                    Text('${recipe.time.round()} minuter'),
                    SizedBox(width: AppTheme.paddingMedium),
                    Text('${recipe.price.round()} kr'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
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