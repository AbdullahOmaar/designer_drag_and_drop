class DragResponseModel {
  bool? isVisible;
  String? childWidgetItem;
  String? title;
  int? width;
  int? height;
  int? itemId;
  int? itemIndex;

  DragResponseModel(
      {this.isVisible,
        this.childWidgetItem,
        this.title,
        this.width,
        this.height,
        this.itemId,
        this.itemIndex});

  DragResponseModel.fromJson(Map<String, dynamic> json) {
    isVisible = json['isVisible'];
    childWidgetItem = json['childWidgetItem'];
    title = json['title'];
    width = json['width'];
    height = json['height'];
    itemId = json['itemId'];
    itemIndex = json['itemIndex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isVisible'] = this.isVisible;
    data['childWidgetItem'] = this.childWidgetItem;
    data['title'] = this.title;
    data['width'] = this.width;
    data['height'] = this.height;
    data['itemId'] = this.itemId;
    data['itemIndex'] = this.itemIndex;
    return data;
  }
}
