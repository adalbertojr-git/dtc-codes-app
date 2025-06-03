import 'package:flutter/material.dart';

const String _pathLogo = 'assets/imgs/logo.png';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String _title;

  const MyAppBar(this._title, {super.key});

  @override
  Widget build(BuildContext context) => AppBar(
        title: Text(
          _title,
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(_pathLogo),
            ),
          ),
        ],
      );
      
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}
