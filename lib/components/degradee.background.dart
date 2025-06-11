import 'package:flutter/material.dart';

class DegradeBackground extends StatelessWidget {
  final Widget _widget;

  DegradeBackground(this._widget);

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.black, Colors.deepOrange],
        begin: FractionalOffset.topLeft,
        end: FractionalOffset.bottomRight,
      ),
    ),
    child: Center(child: SizedBox(width: 60, height: 60, child: _widget,),),
  );
}
