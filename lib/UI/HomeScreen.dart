// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:s2go_designer_drag_and_drop/UI/ItemWidget.dart';

class HomePageView extends StatefulWidget {
  const   HomePageView({Key? key}) : super(key: key);

  @override
  HomePageViewState createState() => HomePageViewState();
}

class HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
     return ItemWidget();
  }

}
