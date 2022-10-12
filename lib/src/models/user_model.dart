import 'dart:convert';

class UserModel {
  final String uid;
  final String names;
  final String email;
  final String phoneNumber;
  final String? avatarURL;
  final String gender;
  final String profession;
  final String town;
  UserModel({
    required this.uid,
    required this.names,
    required this.email,
    required this.phoneNumber,
    this.avatarURL,
    required this.gender,
    required this.profession,
    required this.town,
  });

  UserModel copyWith({
    String? uid,
    String? names,
    String? email,
    String? phoneNumber,
    String? avatarURL,
    String? gender,
    String? profession,
    String? town,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      names: names ?? this.names,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      avatarURL: avatarURL ?? this.avatarURL,
      gender: gender ?? this.gender,
      profession: profession ?? this.profession,
      town: town ?? this.town,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'names': names});
    result.addAll({'email': email});
    result.addAll({'phoneNumber': phoneNumber});
    if (avatarURL != null) {
      result.addAll({'avatarURL': avatarURL});
    }
    result.addAll({'gender': gender});
    result.addAll({'profession': profession});
    result.addAll({'town': town});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      names: map['names'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      avatarURL: map['avatarURL'],
      gender: map['gender'] ?? '',
      profession: map['profession'] ?? '',
      town: map['town'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(uid: $uid, names: $names, email: $email, phoneNumber: $phoneNumber, avatarURL: $avatarURL, gender: $gender, profession: $profession, town: $town)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.uid == uid &&
        other.names == names &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.avatarURL == avatarURL &&
        other.gender == gender &&
        other.profession == profession &&
        other.town == town;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        names.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        avatarURL.hashCode ^
        gender.hashCode ^
        profession.hashCode ^
        town.hashCode;
  }
}
