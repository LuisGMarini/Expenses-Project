
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;


  AdaptativeButton({ required this.label, required this.onPressed});

  get color => Theme.of(color).primaryColor;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ?
    CupertinoButton(color: Theme.of(context).primaryColor ,
        child: Text(label),
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(horizontal: 20,),
    )
    : ElevatedButton(style:ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor)),
        child: Text(label, style: TextStyle(color: Colors.white)),
        onPressed: onPressed
    );
  }
}

