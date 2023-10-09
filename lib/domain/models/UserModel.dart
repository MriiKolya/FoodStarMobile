class UserModel {
  String name;
  String email;
  String phone;
  String dateOfbirth;
  UserModel({
    required this.dateOfbirth,
    required this.name,
    required this.email,
    required this.phone,
  });

  toJson() {
    return {
      'dateOfbirth': dateOfbirth,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  UserModel copyWith(
      {String? name,
      String? email,
      String? password,
      String? phone,
      String? dateOfbirth}) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      dateOfbirth: dateOfbirth ?? this.dateOfbirth,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        name: (json['name']),
        email: json['email'],
        phone: json['phone'],
        dateOfbirth: json['dateOfbirth'],
      );

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email,phone: $phone,  dateOfbirth : $dateOfbirth)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.email == email && other.phone == phone;
  }
}
