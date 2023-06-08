/// code : "PrefsHelper.getCode()"
/// name : "name"
/// phone : "phone"

class Reservation {
  Reservation({
      this.code, 
      this.name, 
      this.phone,});

  Reservation.fromJson(dynamic json) {
    code = json['code'];
    name = json['name'];
    phone = json['phone'];
  }
  String? code;
  String? name;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['name'] = name;
    map['phone'] = phone;
    return map;
  }

}