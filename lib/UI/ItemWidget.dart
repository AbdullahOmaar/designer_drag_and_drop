import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s2go_designer_drag_and_drop/UI/DragableItem.dart';
import 'package:s2go_designer_drag_and_drop/model/drag_model.dart';
import 'package:s2go_designer_drag_and_drop/model/pair_model.dart';

class ItemWidget extends StatefulWidget {


     ItemWidget({Key? key,}) : super(key: key);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {

  late Pair currentItemInfo;
  late Pair newItemInfo;

  // bool isInCard = false;
  // bool isInCardSec = false;
  // bool isInCardThird = false;


  List<DragModel> columnWidgets(){
    return [
      DragModel(
        isVisible: false,
        childWidgetItem: buildWidget(
            AppBar(
              title: Text("AppBar "),
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
            MediaQuery.of(context).size.width,
            50,
            1),
        width: 100,
        height: 100,
        itemId: "1",
        itemIndex: 0,
      ),
      DragModel(
        isVisible: false,
        childWidgetItem: buildWidget(
            Container(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: () {},
                child: Text('Text 1'),
              ),
            ),
            100,
            50,
            2),
        width: 100,
        height: 100,
        itemId: "2",
        itemIndex: 0,
      ),
      DragModel(
        isVisible: false,
        childWidgetItem: buildWidget(
            Container(
              padding: const EdgeInsets.all(15.0),
              child: FlatButton(
                child:  Text('Flat Button 1', style: TextStyle(fontSize: 20.0),),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),
            200,
            70,
            3),
        width: 100,
        height: 100,
        itemId: "3",
        itemIndex: 0,
      ),
      DragModel(
        isVisible: false,
        childWidgetItem:  buildWidget(Container(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.alarm_add)),
            100,
            50,
            4),
        width: 100,
        height: 100,
        itemId: "4",
        itemIndex: 0,
      ),
      DragModel(
        isVisible: false,
        childWidgetItem:  buildWidget(Row(
          children: <Widget>[
            Expanded(
              flex: 6, // 60%
              child: buildRowWidget(),
            ),
          ],
        ),
            MediaQuery.of(context).size.width,
            100,
            5),
        width: 100,
        height: 100,
        itemId: "5",
        itemIndex: 0,
      ),
      DragModel(
        isVisible: false,
        childWidgetItem:  buildWidget(
            Container(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                enabled: false,
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
                  hintText: 'title',
                  hintStyle: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            ),
            230,
            50,
            5),
        width: 100,
        height: 100,
        itemId: "5",
        itemIndex: 0,
      ),
      DragModel(
        isVisible: false,
        childWidgetItem:  buildWidget(
            Container(
              padding: const EdgeInsets.all(10.0),
              child: const CircleAvatar(
                backgroundColor: Colors.black12,
                radius: 50.0,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/NTG-Clarity-Networks-Inc.png'),
                  radius: 63.0,
                ),
              ),
            ),
            230,
            150,
            150),
        width: 100,
        height: 100,
        itemId: "5",
        itemIndex: 0,
      ),


    ] ;
  }
  static List<DragModel> cardWidgets = [];
  static List<DragModel> RowWidgets = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround  ,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
              ),
              height: 700,
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
            height: 700,
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
            height: 700,
            width: 250,
            decoration: BoxDecoration(
                border: Border.all(
                  color:  Colors.blueAccent,
                  width: 2,
                )),
            child: widgetProperties( 10, 10),
          ),

        ],
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
}