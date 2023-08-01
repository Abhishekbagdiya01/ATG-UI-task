class LessonModel {
  String? requestId;
  List<Items>? items;
  int? count;
  String? anyKey;

  LessonModel({this.requestId, this.items, this.count, this.anyKey});

  LessonModel.fromJson(Map<String, dynamic> json) {
    requestId = json['requestId'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    count = json['count'];
    anyKey = json['anyKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requestId'] = this.requestId;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    data['anyKey'] = this.anyKey;
    return data;
  }
}

class Items {
  String? createdAt;
  String? name;
  int? duration;
  String? category;
  bool? locked;
  String? id;

  Items(
      {this.createdAt,
      this.name,
      this.duration,
      this.category,
      this.locked,
      this.id});

  Items.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    duration = json['duration'];
    category = json['category'];
    locked = json['locked'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['name'] = this.name;
    data['duration'] = this.duration;
    data['category'] = this.category;
    data['locked'] = this.locked;
    data['id'] = this.id;
    return data;
  }
}
