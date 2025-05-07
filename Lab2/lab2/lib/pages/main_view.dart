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
import 'package:lab2/app_theme.dart';


class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
        _controlPanel(context),
        SizedBox(width: AppTheme.paddingSmall), 
        const Expanded(child: RecipeArea()),
      ],
    ),
    );
  }

Widget _controlPanel(context, {double width = 320}) {
   return Container(
      padding:  EdgeInsets.only(right: AppTheme.paddingSmall, left: AppTheme.paddingMedium),
      width: width,
      color: const Color.fromARGB(255, 193, 210, 218),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Center(
          child: Logo(),
        ),
        SizedBox(height: 8),
        Text('Hitta ett recept som passar genom att ändra inställningarna nedanför'),
        SizedBox(height: 8),
        IngredientControl(),
        SizedBox(height: 8),
        KitchenControl(),
        Text('Svårighetsgrad'),
        DifficulyControl(),
        Text('Maxpris'),
        PriceControl(),
        SizedBox(height: 30),
        Text('Maxtid'),
        TimeControl()
      ],
    ),
   );
}
}