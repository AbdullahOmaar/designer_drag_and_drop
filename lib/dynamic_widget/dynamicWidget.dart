import 'dart:async';

import 'package:s2go_designer_drag_and_drop/widget_json.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/basic/dynamic_widget_json_exportor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';


class DynamicWidget extends StatefulWidget {
  DynamicWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DynamicWidgetState createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<DynamicWidget> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          title: Text(widget.title),
        ),
        body: CustomScrollView(slivers: [
          SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  ElevatedButton(
                    child: const Text("Dynamic Widget Json String Export Example"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JSONExporter()));
                    },
                  )
                ]),
              )),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
              ),
              delegate: SliverChildListDelegate([
                ElevatedButton(
                  child: const Text("Container"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(containerJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("Row"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodeEditorPage(rowJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("Column"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodeEditorPage(columnJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("Text"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodeEditorPage(textJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("SelectableText"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(selectableTextJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("TextSpan"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(textSpanJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("Icon"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodeEditorPage(iconJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("DropCapText"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(dropCapTextJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("DropCapText with Image"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(dropCapTextImageJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("RaisedButton"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(raisedButtonJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("ElevatedButton"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(elevatedButtonJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("TextButton"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(textButtonJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("Asset Image"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(assetImageJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("Network Image"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(networkImageJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("Placeholder"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(placeholderJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("GridView"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(gridviewJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("ListView"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(listviewJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("PageView"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(pageviewJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("Expanded"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(expandedJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("ListView Auto load more"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(listviewLoadmoreJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("GridView Auto load more"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(gridviewloadmoreJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("Stack and Positioned"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodeEditorPage(stackJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("IndexedStack"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(indexedstackJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("SizedBox"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(sizedboxJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("Opacity"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodeEditorPage(opacityJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("Wrap"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodeEditorPage(wrapJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("ClipRRect"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(cliprrectJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("SafeArea"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(safeareaJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("ListTile"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(listTileJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("Scaffold & AppBar"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(scaffoldAppBarJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("LimitedBox"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(limitedboxJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("Offstage"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(offstageJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("OverflowBox"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(overflowboxJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("Divider"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodeEditorPage(dividerJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("RotatedBox"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(rotatedBoxJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("Card"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodeEditorPage(cardJson)));
                  },
                ),
                ElevatedButton(
                  child: const Text("SingleChildScrollView"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(singleChildScrollViewJson)));
                  },
                ),
              ]),
            ),
          ),
        ]));
  }
}

class CodeEditorPage extends StatefulWidget {
  final String jsonString;

  CodeEditorPage(this.jsonString);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CodeEditorPageState(jsonString);
  }
}

class _CodeEditorPageState extends State<CodeEditorPage> {
  String jsonString;
  TextEditingController controller = TextEditingController();

  _CodeEditorPageState(this.jsonString);

  @override
  Widget build(BuildContext context) {
    var widget = Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Code Editor"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                constraints: const BoxConstraints.expand(
                    width: double.infinity, height: double.infinity),
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(hintText: 'Enter json string'),
                  maxLines: 1000000,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              child: const Text("Preview"),
              onPressed: () {
                setState(() {
                  jsonString = controller.text;
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PreviewPage(controller.text)));
              },
            )
          ],
        ));
    controller.text = jsonString;
    return widget;
  }
}

class PreviewPage extends StatelessWidget {
  final String jsonString;

  PreviewPage(this.jsonString);

  late DynamicWidgetJsonExportor? _exportor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Preview"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Widget?>(
              future: _buildWidget(context),
              builder: (BuildContext context, AsyncSnapshot<Widget?> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return snapshot.hasData
                    ? _exportor = DynamicWidgetJsonExportor(
                  child: snapshot.data,
                )
                    : const Text("Loading...");
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              var exportJsonString = _exportor?.exportJsonString();
              if (exportJsonString!=null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CodeEditorPage(exportJsonString)));
              }
            },
            child: const Text("export json code"),
          )
        ],
      ),
    );
  }

  Future<Widget?> _buildWidget(BuildContext context) async {
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

class JSONExporter extends StatefulWidget {
  @override
  _JSONExporterState createState() => _JSONExporterState();
}

class _JSONExporterState extends State<JSONExporter> {
  GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("export example"),
      ),
      body: Builder(
        builder: (context) => Container(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: DynamicWidgetJsonExportor(
                  key: key,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Image.asset("assets/vip.png"),
                      Positioned(
                        child: Image.asset("assets/vip.png"),
                        top: 50,
                        left: 50,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  child: const Text("Export"),
                  onPressed: () {
                    var exportor =
                    key.currentWidget as DynamicWidgetJsonExportor;
                    var exportJsonString = exportor.exportJsonString();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                        Text("json string was exported to editor page.")));
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CodeEditorPage(exportJsonString)));
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}