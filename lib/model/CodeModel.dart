/// code : "F1234"
/// entries : 3
/// isReserved : false

class CodeModel {
  static const String collectionName = 'code';
  CodeModel({
      this.code, 
      this.entries, 
      this.isReserved,
      this.id});

  CodeModel.fromJson(dynamic json) {
    code = json['code'];
    entries = json['entries'];
    isReserved = json['isReserved'];
  }
  String? code;
  int? entries;
  bool? isReserved;
  String? id;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['entries'] = entries;
    map['isReserved'] = isReserved;
    return map;
  }

}