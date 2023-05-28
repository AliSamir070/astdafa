class User {
  static const String collectionName = 'users';
  String? id;
  String? password;
  String? email;
  String? phone;
  String? name;

  User(
      {this.id,
      this.password,
      this.email,
      this.phone,
      this.name});

  User.fromFireStore(Map<String, dynamic>? data)
      : this(
            id: data?['id'],
            password: data?['password'],
            email: data?['email'],
            phone: data?['phone'],
            name: data?['name']);

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'password': password,
      'email': email,
      'phone': phone,
      'name': name,
    };
  }
}
