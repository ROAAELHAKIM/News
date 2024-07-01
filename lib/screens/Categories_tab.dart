import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Categorie_model.dart';
import 'Categorie_item.dart';

class Categories_tab extends StatelessWidget {
  List<CategorieModel> allCategories = CategorieModel.getCategories();

  Function OnClick;
  Categories_tab({required this.OnClick,super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pick your category \n of interest",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700,color: Color(0xFF4F5A69)),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: GridView.builder(itemBuilder: (context, index) {
                  return  InkWell(
                    onTap: () {
                      OnClick( allCategories[index]);

                    },
                    child: CategorieItem(
                        model: allCategories[index],
                      index: index,
                    ),
                  );

                },
                  itemCount: allCategories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 25, crossAxisSpacing: 25),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
