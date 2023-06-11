/// code : "PrefsHelper.getCode()"
/// name : "name"
/// phone : "phone"

class Reservation {
  Reservation({
      this.code, 
      this.name, 
      this.phone,
      this.from,
      this.to});

  Reservation.fromJson(dynamic json) {
    code = json['code'];
    name = json['name'];
    phone = json['phone'];
    from = json["from"]!=null?DateTime.fromMillisecondsSinceEpoch(json["from"]):null;
    to = json["from"]!=null?DateTime.fromMillisecondsSinceEpoch(json["to"]):null;
  }
  String? code;
  String? name;
  String? phone;
  DateTime? from;
  DateTime? to;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['name'] = name;
    map['phone'] = phone;
    map['from'] = from?.millisecondsSinceEpoch;
    map['to'] = to?.millisecondsSinceEpoch;
    return map;
  }

}