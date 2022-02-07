
import 'package:s2go_designer_drag_and_drop/model/drag_model.dart';

class Pair {
  Pair(this.key,/* this.value*/this.dragModel);

  final int key;
  //final int value;
  final DragModel dragModel;

  @override
  String toString() => 'Pair[$key,$dragModel]';
}