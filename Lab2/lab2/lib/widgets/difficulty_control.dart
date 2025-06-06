import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:provider/provider.dart';


class DifficulyControl extends StatefulWidget {
   const DifficulyControl({super.key});

   @override
   State<DifficulyControl> createState() => _DifficulyControlState();
}

class _DifficulyControlState extends State<DifficulyControl> {
 String _difficulty = Difficulty.labels[0];
 @override

Widget build(BuildContext context) {
     var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);
  return Column(
    children: [
      for (final label in Difficulty.labels)
          RadioListTile<String>(
            dense: true,
            title: label == Difficulty.showAll
                ? Text(label) // Första raden: bara Text utan ikon
                : Row(
                    children: [
                      Difficulty.icon(label, width: 28)!, // Bilden, lite större
                      SizedBox(width: AppTheme.paddingMedium), // Avstånd mellan ikon och text
                      Text(label),
                    ],
                  ),
          value: label,
          groupValue: _difficulty,
          onChanged: (value) {
            setState(() {
              _difficulty = value!;
              recipeHandler.setDifficulty(value);
            });
          },
        ),
      ],
  );
}
}