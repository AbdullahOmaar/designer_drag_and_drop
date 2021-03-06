
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:s2go_designer_drag_and_drop/model/drag_model.dart';
import 'package:s2go_designer_drag_and_drop/model/drag_response_model.dart';

Future<DragResponseModel> getData() async {

  final http.Response response = await http.get(Uri.parse(
      'https://39975648-07f2-4b83-aec7-228dae069ad0.mock.pstmn.io/fcm/settings') ,
      headers: {"Accept": "application/json"});

  print("==> ${response.body.toString()}");

  if (response.statusCode == 200) {
    // parsing json into List of objects
   //  parsed = json.decode(response.body).cast<String, dynamic>();
   // print('parsed data = ${parsed}');


  }
  return DragResponseModel.fromJson(json.decode(response.body).cast<String, dynamic>()) ;
} // end getData()
