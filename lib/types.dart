import 'package:flutter/material.dart';
import 'home_screen.dart';

Color Istypes(dynamic type){

  return type == 'Grass' ? Colors.greenAccent :
  type =='Fire' ? Colors.redAccent:
   type=='Water' ? Colors.blueAccent:
   type == 'Bug' ? Colors.green: 
   type == 'Normal'? Colors.blueGrey :
   type == 'Poison'?Colors.purpleAccent:
   type == 'Electric'?Colors.yellow: 
   type == 'Ground'? Colors.orange.shade100:
   type =='Rock'? Colors.brown:
   type =='Fighting'?Colors.red:
   type == 'Psychic'?Colors .pink:
   type == 'Ghost'? Colors.purple:
   type == 'Ice'?Colors.blue.shade200:
   type == 'Dragon'?Colors.indigo:
   Colors.black;
}