
import 'package:flutter/material.dart';
import 'package:mechanics/widget/categories_widget.dart';
import 'package:mechanics/widget/text_widget.dart';

import '../services/utils.dart';

class CategoriesScreen extends StatelessWidget {
   CategoriesScreen({Key? key}) : super(key: key);

  List<Color> gridColors = [
    Color.fromARGB(255, 255, 255, 255),
    Color.fromARGB(255, 243, 232, 221),
    Color.fromARGB(255, 241, 236, 235),
  ];

List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/category/categ-1.png',
      'catText': 'Spare Parts',
    },
    {
      'imgPath': 'assets/images/category/categ-2.png',
      'catText': 'Motor Oil',
    },
    {
      'imgPath': 'assets/images/category/categ-3.png',
      'catText': 'Tires',
    },
  ];
  @override
  Widget build(BuildContext context) {

    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            text: 'Categories',
            color: color,
            textSize: 24,
            isTitle: true,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 240 / 250,
            crossAxisSpacing: 10, // Vertical spacing
            mainAxisSpacing: 10, // Horizontal spacing 
            children: List.generate(catInfo.length, (index) {
              return CategoriesWidget(
                catText: catInfo[index]['catText'],
                imgPath: catInfo[index]['imgPath'],
                passedColor: gridColors[index],
              );
            }),
          ),
        ));
  }
}
