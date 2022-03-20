import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class DragModel{
   bool isVisible=false;
   Widget  childWidgetItem; // WidgetItem childWidgetItem;
   int width;
   int height;
   String itemId;
   int itemIndex;


   @override
  String toString() {
 return '$width $height $itemId $itemIndex $isVisible';
  }

  DragModel({
      required this.isVisible,
      required this.childWidgetItem,
      required this.width,
      required this.height,
      required this.itemId,
      required this.itemIndex,
   });
   factory DragModel.fromJson(Map<String,dynamic> json){
     return DragModel(
         isVisible: json['isVisible'],
         childWidgetItem: json['childWidgetItem'],
         width: json['width'],
         height: json['height'],
         itemId: json['itemId'],
         itemIndex: json['itemIndex']);
   }
Map<String, dynamic> toJson()=>{
     "isVisible":isVisible ,
     "childWidgetItem":isVisible ,
     "width":width ,
     "height":height ,
     "itemId":itemId ,
     "itemIndex":itemIndex ,
};

   // @override
   // String toString() => 'drag model $itemId, $height,$width item index $itemIndex';
}

 int itemID = 0;



Widget buildWidget(Widget, width, height, itemId) {
   return InkWell(
      onTap: () => {
       itemID = itemId,
       print("${itemID} , 'itemID"),
      },
      child: Container(
        child:  Widget,
        width: width,
        height: height,
     ),
   );
}


Widget widgetProperties(width, height) {
   return Scaffold(
       appBar: AppBar(
          title: const Text('Screen Properties'),
       ),
       body: Container(
          child: SingleChildScrollView(
             padding: const EdgeInsets.all(45),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                     _buildTextInput( itemID, 'title'),
                  ]
                ),
          ),
       ));
   }


Widget _buildTextInput(itemID , String title) {
   return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         // Text(
         //    title,
         //    // style: TextStyle(color: Black_S2G_Designer),
         // ),
         Spacer(),
         SizedBox(
            width: 150,
            height: 35,
            child: TextField(
               // controller: itemID,
               textAlign: TextAlign.center,
               textAlignVertical: TextAlignVertical.center,
               decoration: InputDecoration(
                  labelText: "${itemID}",
                  focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.black),
                     borderRadius: BorderRadius.circular(8.0),
                  ),
                  // contentPadding: const EdgeInsets.all(20),
                  border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: title,
                  hintStyle: const TextStyle(
                     fontSize: 10,
                  ),
               ),
            ),
         ),
      ],
   );
}
