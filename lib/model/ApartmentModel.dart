import 'Reservation.dart';

/// address : ""
/// describtion : ""
/// id : ""
/// isReserved : false
/// location : ""
/// photos : ["link1","link2"]
/// userId : ""

class ApartmentModel {
  static String collection = "apartment";
  ApartmentModel({
      this.address, 
      this.describtion, 
      this.id, 
      this.isReserved, 
      this.location, 
      this.photos, 
      this.userId,
      this.name,
      this.reservation});

  ApartmentModel.fromJson(dynamic json) {
    address = json['address'];
    describtion = json['describtion'];
    id = json['id'];
    isReserved = json['isReserved'];
    location = json['location'];
    photos = json['photos'] != null ? json['photos'].cast<String>() : [];
    userId = json['userId'];
    name = json['username'];
    reservation = json["reservation"] != null?Reservation.fromJson(json["reservation"]):null;
  }
  String? address;
  String? describtion;
  String? id;
  bool? isReserved;
  String? location;
  List<String>? photos;
  String? userId;
  String? name;
  Reservation? reservation;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = address;
    map['describtion'] = describtion;
    map['id'] = id;
    map['isReserved'] = isReserved;
    map['location'] = location;
    map['photos'] = photos;
    map['userId'] = userId;
    map['username'] = name;
    if(reservation != null){
      map["reservation"] = reservation?.toJson();
    }
    return map;
  }

}