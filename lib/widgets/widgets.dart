

import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s2go_designer_drag_and_drop/model/drag_model.dart';
import 'package:s2go_designer_drag_and_drop/model/drag_response_model.dart';


class Widgets {

  Future callAPIdata(DragResponseModel dragResponseModel) async {
    switch(dragResponseModel.childWidgetItem){
      case 'AppBar':
        return buildAppBar(dragResponseModel.title, dragResponseModel.width, dragResponseModel.height);
        break;
      case 'TextButton':
        return buildTextButton(dragResponseModel.title,);
        break;
    }
  }

  DragModel buildAppBar(title, width, height) {
    return DragModel(
        isVisible: false,
        childWidgetItem: buildWidget(
           AppBar(
                title: Text( title ),
          leading: Icon(Icons.arrow_back),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert,),
              onPressed: () {
              },
            )
          ],
          actionsIconTheme: IconThemeData(size: 32,),
        ),
        400,
        50,
        2),
        width: 100,
        height: 100,
        itemId: "1",
        itemIndex: 0,
      );
}

  DragModel buildTextButton(title) {
    return DragModel(
      isVisible: false,
      childWidgetItem: buildWidget(
          Container(
            padding: const EdgeInsets.all(5.0),
            child: TextButton(
              onPressed: () {},
              child: Text( title ),
            ),
          ),
          100,
          50,
          2),
      width: 100,
      height: 100,
      itemId: "2",
      itemIndex: 0,
    );

  }


}
