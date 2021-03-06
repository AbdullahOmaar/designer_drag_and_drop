// ignore: file_names
// ignore_for_file: file_names

import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s2go_designer_drag_and_drop/UI/DragableItem.dart';
import 'package:s2go_designer_drag_and_drop/model/drag_model.dart';
import 'package:s2go_designer_drag_and_drop/model/drag_response_model.dart';
import 'package:s2go_designer_drag_and_drop/model/pair_model.dart';
import 'package:s2go_designer_drag_and_drop/network/api.dart';
import 'package:s2go_designer_drag_and_drop/widget_json.dart';
import 'package:s2go_designer_drag_and_drop/widgets/widgets.dart';

class ItemWidget extends StatefulWidget {


     ItemWidget({Key? key,}) : super(key: key);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {

  late Pair currentItemInfo;
  late Pair newItemInfo;
  // final FirebaseFirestore _db = FirebaseFirestore.instance ;

  // bool isInCard = false;
  // bool isInCardSec = false;
  // bool isInCardThird = false;


  List<DragModel> columnWidgets(){
    return [
      Widgets().buildAppBar('AppBat', 400, 50),
      Widgets().buildTextButton( 'Text 1' ),
      Widgets().buildContainer( context, 'Container' ),
      Widgets().buildRowJson( context, 'buildRowJson' ),

    ] ;
  }
  static List<DragModel> cardWidgets = [];

  static List<DragModel> RowWidgets = [];
  static List<DragModel> columnUDA = [];
  static List<DragModel> listUDA = [];


  @override
  Widget build(BuildContext context) {
    Map<String , Object> parsedData = {} ;

    cardWidgets.forEach((e){
      print('clicked: ${e.toJson()} ');
       parsedData = {
        'widgetItem' : e.childWidgetItem,
      } ;
      print('widgetItem : ${parsedData['widgetItem']}');
    });
    dynamic Item = parsedData['widgetItem'] ;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround  ,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                    ),
                    height: 600,
                    width: 300,
                    child: DragTarget<DragModel>(
                      builder: (BuildContext context, List<dynamic> candidateData,
                          List<dynamic> rejectedData) {
                        return Column(
                            children: columnWidgets().map((dragItem) {
                              return DragableItem(
                                  dragModel: dragItem, onChangePlace: _replaceItemInList);
                            }).toList());
                      },
                      onAccept: (DragModel data) {
                        changePlace(
                            data, removeItemList: cardWidgets, addItemList: columnWidgets());
                      },
                    ),
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(4),
                  height: 600,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black,
                  ),
                  child: DragTarget<DragModel>(
                    builder: (BuildContext context, candidateData,
                        List<dynamic> rejectedData) {
                      print('${candidateData.toList()}');
                      // print('${defaultTextBtn.isInCard}');
                      return Container(
                        child: Card(
                          child: Column(
                            children: cardWidgets.length == 0
                                ? [Container()]
                                :  cardWidgets.map((dragItem) {
                              return DragableItem(
                                  dragModel: dragItem,
                                  onChangePlace: _replaceItemInList);
                            }).toList(),
                          ),
                        ),
                      );
                    },
                    onAccept: (DragModel data) {
                      changePlace(data, removeItemList: columnWidgets(), addItemList: cardWidgets);
                      print("${data.toString()}, data.toString ");
                    },
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(4),
                  height: 600,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black,
                  ),
                  child: DragTarget<DragModel>(
                    builder: (BuildContext context, candidateData,
                        List<dynamic> rejectedData) {
                      print('${candidateData.toList()}');
                      // print('${defaultTextBtn.isInCard}');
                      return Container(
                        child: Card(
                          child: Column(
                            // children: cardWidgets.length == 0
                            //     ? [Container()]
                            //     :  cardWidgets.map((dragItem) {
                            //   return DragableItem(
                            //       dragModel: dragItem,
                            //       onChangePlace: _replaceItemInList);
                            // }).toList(),
                          ),
                        ),
                      );
                    },
                    onAccept: (DragModel data) {
                      changePlace(data, removeItemList: columnWidgets(), addItemList: cardWidgets);
                      print("${data.toString()}, data.toString ");
                    },
                  ),
                ),

                // Container(
                //   // padding: EdgeInsets.all(4),
                //   height: 700,
                //   width: 250,
                //   decoration: BoxDecoration(
                //       border: Border.all(
                //         color:  Colors.blueAccent,
                //         width: 2,
                //       )),
                //   child: widgetProperties( 10, 10),
                // ),

              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * .1,
              height: MediaQuery.of(context).size.height * .1,
              child: ElevatedButton(
                onPressed: () async{
                  cardWidgets.forEach((e){
                    print('clicked: ${e.toJson()} ');
                    parsedData = {
                      'widgetItem' : e.childWidgetItem,
                    } ;
                    print('widgetItem : ${parsedData['widgetItem']}');
                     getData().then((dragModel){
                       setState(() {
                         String addItemInRowtoJson =
                         '''
                            "type" : "Text",
                            "data" : "new  "
                         ''';
                         addItemInRowJson(addItemInRow: addItemInRowtoJson);
                         Widgets().callAPIdata(dragModel).then((value){
                           // cardWidgets.add(value);
                         });
                         // print(">>>=${dragModel}");
                       });
                       // print('returned data : $dragModel {DragResponseModel.fromJson(dragModel.height)}');
                      });
                  });
                  Item = parsedData['widgetItem'] ;
                },
                child: Text('call API'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRowWidget() {
    return Container(
      // height: 700,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent)
      ),
      child: DragTarget<DragModel>(
        builder: (BuildContext context, candidateData,
            List<dynamic> rejectedData) {
          print('${candidateData.toList()}');
          // print('${defaultTextBtn.isInCard}');
          return Container(
            child: Row(
              children: RowWidgets.length == 0
                  ? [Container()]
                  :  RowWidgets.map((dragItem) {
                return DragableItem(
                    dragModel: dragItem,
                    onChangePlace: _replaceItemInList);
              }).toList(),
            ),
          );
        },
        onAccept: (DragModel data) {
          changePlace(data, removeItemList: columnWidgets(), addItemList: RowWidgets);
        },
      ),
    );
  }

  void changePlace(
      DragModel dragItem, {
        required List<DragModel> removeItemList,
        required List<DragModel> addItemList,
      }) {
    setState(() {
      removeItemList.removeWhere((element) => element == dragItem);
      if (!addItemList.contains(dragItem)) {
        addItemList.add(dragItem);
        dragItem.itemIndex = addItemList.indexOf(dragItem);
        print('${dragItem.itemIndex}, dragItem.itemIndex');
      }
    });
  }

  void _replaceItemInList(DragModel newItemModel, DragModel oldItemModel) {

    if (cardWidgets.contains(newItemModel)) {
      if (!identical(newItemModel, oldItemModel)) {
        currentItemInfo = Pair(cardWidgets.indexOf(newItemModel), newItemModel);
        newItemInfo = Pair(cardWidgets.indexOf(oldItemModel), oldItemModel);
      }

      //   for (var item in cardWidgets) {
      //   if (identical(item, oldItemModel)) {
      //     currentItemInfo = Pair(cardWidgets.indexOf(item), item);
      //   }
      //   if (identical(item, newItemModel)) {
      //     newItemInfo = Pair(cardWidgets.indexOf(item), item);
      //   }
      // }
      if (currentItemInfo != null && newItemInfo != null) {
        newItemInfo.dragModel.itemIndex = currentItemInfo.key;
        currentItemInfo.dragModel.itemIndex = newItemInfo.key;
        cardWidgets[currentItemInfo.key] = newItemInfo.dragModel;
        cardWidgets[newItemInfo.key] = currentItemInfo.dragModel;
      }
      for (var item in cardWidgets) {
        // print('${item.toString()}AAA');
      }
    }else{
      newItemModel.itemIndex=oldItemModel.itemIndex;
      oldItemModel.itemIndex+=1;
      // cardWidgets.add(newItemModel);
      cardWidgets.insert(newItemModel.itemIndex, newItemModel);
      columnWidgets().removeWhere((element) => element == newItemModel);      // for(var i =oldItemModel.itemIndex; i<cardWidgets.length ;i++){
      //  cardWidgets[i+1].itemIndex+=1;
      // }

    }
    setState(() {});
  }

  // void saveInstance() async {
  //   String data = '' ;
  //   cardWidgets.forEach((element) {
  //    data = jsonEncode(element);
  //     print('data : $data');
  //   });
  //   _db.collection('users').doc('value').set({
  //     'parsedData' : data ,
  //     'lastSignIn' : DateTime.now() ,
  //   });
  // }
}