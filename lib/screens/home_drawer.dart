import 'package:flutter/material.dart';

typedef onMenuItemClick=void Function (MenuItem);

class HomeDrawer extends StatelessWidget {
  onMenuItemClick itemClick;

   HomeDrawer({required this.itemClick,super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 50),
            width: double.infinity,
            color: Colors.green,
            child: Center(
              child: Text(
                "News App!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              itemClick(MenuItem.Categories);

            },
            child: Row(
              children: [
                Icon(
                  Icons.list,
                  size: 30,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Categories",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),

              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              itemClick(MenuItem.Settings);

            },
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 30,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  " Settings",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum MenuItem{
  Categories,
  Settings,

}