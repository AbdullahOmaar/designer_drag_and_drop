import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/basic/dynamic_widget_json_exportor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s2go_designer_drag_and_drop/model/drag_model.dart';
import 'package:s2go_designer_drag_and_drop/model/drag_response_model.dart';
import 'package:s2go_designer_drag_and_drop/widget_json.dart';

 class Widgets{



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

  DragModel buildContainer(context, title) {
    return  DragModel(
      isVisible: false,
      childWidgetItem: buildWidget(
          Container(
            padding: const EdgeInsets.all(5.0),
            child: FutureBuilder<Widget?>(
              future: _buildWidget(context, containerJson),
              builder: (BuildContext context, AsyncSnapshot<Widget?> snapshot) {
                if (snapshot.hasError) {
                  print("==> ${snapshot.error}");
                }
                return snapshot.hasData
                    ? _exportor = DynamicWidgetJsonExportor(
                  child: snapshot.data,
                )
                    : const Text("Loading...");
              },
            ),
          ),
          MediaQuery.of(context).size.width * .5,
          MediaQuery.of(context).size.height * .2,
          2),
      width: 100,
      height: 100,
      itemId: "2",
      itemIndex: 0,
    );

  }

  DragModel buildRowJson(context, title) {
    return  DragModel(
      isVisible: false,
      childWidgetItem: buildWidget(
          Container(
            padding: const EdgeInsets.all(5.0),
            child: FutureBuilder<Widget?>(
              future: _buildWidget(context, rowJson),
              builder: (BuildContext context, AsyncSnapshot<Widget?> snapshot) {
                if (snapshot.hasError) {
                  print("==> ${snapshot.error}");
                }
                return snapshot.hasData
                    ? _exportor = DynamicWidgetJsonExportor(
                  child: snapshot.data,
                )
                    : const Text("Loading...");
              },
            ),
          ),
          MediaQuery.of(context).size.width * .5,
          MediaQuery.of(context).size.height * .2,
          2),
      width: 100,
      height: 100,
      itemId: "2",
      itemIndex: 0,
    );

  }


  // late final String jsonString = textSpanJson;
  late DynamicWidgetJsonExportor? _exportor;


  Future<Widget?> _buildWidget( BuildContext context, jsonString) async {
    print("runtimeType > ${jsonString.runtimeType}");
    print("runtimeType > ${jsonString}");
    return DynamicWidgetBuilder.build(
        jsonString, context, new DefaultClickListener());
  }


}


class DefaultClickListener implements ClickListener {
  @override
  void onClicked(String? event) {
    print("Receive click event: " + (event == null ? "" : event));
  }

}