import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Categorie_model.dart';

class CategorieItem extends StatelessWidget {
  int index;
  CategorieModel model;

  CategorieItem({required this.index, required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148,
      height: 171,
      decoration: BoxDecoration(
        color: model.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomLeft: index.isOdd?Radius.circular(25):Radius.zero,
          bottomRight: index.isEven?Radius.circular(25):Radius.zero,
        ),
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(model.image)),
          Container(
              margin: EdgeInsets.only(bottom: 18),
              child: Text(
                model.name,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              )),
        ],
      ),
    );
  }
}
