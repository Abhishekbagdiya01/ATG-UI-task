class ProgramModel {
  String? requestId;
  List<Items>? items;
  int? count;
  String? anyKey;

  ProgramModel({this.requestId, this.items, this.count, this.anyKey});

  ProgramModel.fromJson(Map<String, dynamic> json) {
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
  String? category;
  int? lesson;
  String? id;
  String? userName;
  String? mobileNo;
  String? emailId;
  String? city;
  String? password;

  Items(
      {this.createdAt,
      this.name,
      this.category,
      this.lesson,
      this.id,
      this.userName,
      this.mobileNo,
      this.emailId,
      this.city,
      this.password});

  Items.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    category = json['category'];
    lesson = json['lesson'];
    id = json['id'];
    userName = json['userName'];
    mobileNo = json['mobileNo'];
    emailId = json['emailId'];
    city = json['city'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['name'] = this.name;
    data['category'] = this.category;
    data['lesson'] = this.lesson;
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['mobileNo'] = this.mobileNo;
    data['emailId'] = this.emailId;
    data['city'] = this.city;
    data['password'] = this.password;
    return data;
  }
}
