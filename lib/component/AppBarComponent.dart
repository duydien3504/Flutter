import 'package:flutter/material.dart';

import '../Utils.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget{
  String _title;

  AppBarComponent(this._title);

  @override
  Widget build(BuildContext context) {
    return AppBar(backgroundColor: const Color.fromARGB(255, 17, 118, 20), title: Text("${this._title}", style: TextStyle(color: Colors.white),),actions: [
      Text("${Utils.userName}",style: TextStyle(color: Colors.white,fontSize: 20) ),
      SizedBox(width: 20,)

    ],);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}