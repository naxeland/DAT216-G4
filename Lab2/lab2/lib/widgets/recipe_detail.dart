import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/constants/assets.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/ui_controller.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/util/main_ingredient.dart';
import 'package:provider/provider.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.blue.withAlpha(30),
        child: Container(
          height: 600,
          width: 300,
          child: Stack(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        clipBehavior: Clip.hardEdge,
                        children: [
                          _image(recipe),
                          Positioned(
                            bottom: 4,
                            right: 4,
                            child: Cuisine.flag(recipe.cuisine, width: 60)!,
                          ),
                        ],
                      ),
                      Text('Ingredienser', style: AppTheme.mediumHeading, textAlign: TextAlign.start),
                      Text(recipe.servings.toString() + ' portioner', style: AppTheme.smallHeading, textAlign: TextAlign.start),
                      SizedBox(height: AppTheme.paddingMediumSmall),
                      ...recipe.ingredients.map((ingredient) => 
                        Text(ingredient.toString()),
                      ),
                    ],
                  ),
                  SizedBox(width: AppTheme.paddingMedium),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          recipe.name,
                          style: AppTheme.largeHeading,
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
                        Text(
                          recipe.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          'Tillagning:',
                          style: AppTheme.mediumHeading,
                        ),
                        Text(recipe.instruction),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Color.fromARGB(255, 0, 0, 0)),
                  onPressed: () {
                    uiController.deselectRecipe();
                  },
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
        width: 240, // Square width
        height: 240, // Square height
        child: FittedBox(fit: BoxFit.cover, child: recipe.image),
      ),
    );
  }
}