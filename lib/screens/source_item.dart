import 'package:flutter/material.dart';

import '../models/source_response.dart';

class SorceItem extends StatelessWidget {
  Sources  source;
  bool isSelected;

   SorceItem({super.key,required this.isSelected,required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(20),
      color: isSelected?Colors.green:Colors.transparent
      ),
      child: Text(source.name?? "",style: TextStyle(color: isSelected?Colors.white:Colors.green),),
    );
  }
}
