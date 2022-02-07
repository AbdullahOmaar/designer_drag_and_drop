import 'package:flutter/material.dart';
import 'package:s2go_designer_drag_and_drop/model/drag_model.dart';

class DragableItem extends StatelessWidget {
  DragModel dragModel;
  Function onChangePlace;

  DragableItem({required this.dragModel, required this.onChangePlace});

  @override
  Widget build(BuildContext context) {
    return DragTarget<DragModel>(
      builder: (BuildContext context, List<dynamic> candidateData,
          List<dynamic> rejectedData) {
        return Draggable<DragModel>(
          data: dragModel,
          child: dragModel.childWidgetItem,

          feedback: Material(child: dragModel.childWidgetItem),
          // TextButton(
          //   onPressed: () {},
          //   child: Text('btssn'),
          // ),
        );
      },
      onAccept: (DragModel data) {
        onChangePlace(data,dragModel);

      print('${data.itemId}, data.itemId');
      print('${dragModel.itemId}, dragModel.itemId');
      print('${identical(data, dragModel)}, identical');
      },
    );
  }
}
