/// desc : ""
/// email : ""
/// name : ""

class Complain {
  static const String collectionName = "complains";
  Complain({
      this.desc, 
      this.email, 
      this.name,
      this.id});

  Complain.fromJson(dynamic json) {
    desc = json['desc'];
    email = json['email'];
    name = json['name'];
    id = json['id'];
  }
  String? desc;
  String? email;
  String? name;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['desc'] = desc;
    map['email'] = email;
    map['name'] = name;
    map['id'] = id;
    return map;
  }

}