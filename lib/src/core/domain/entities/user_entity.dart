// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? name;
  final String? email;
  final String? uid;
  final String? status;
  final String? profileUrl;
  final String? password;

  const UserEntity({
    this.id,
    this.name, 
    this.email, 
    this.uid, 
    this.status, 
    this.profileUrl, 
    this.password
  });
  
  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      uid: json["uid"],
      status: json["status"],
      profileUrl: json["profileUrl"],
      password: json["password"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name, 
      "email": email, 
      "uid": uid, 
      "status": status, 
      "profileUrl": profileUrl, 
      "password": password
    };
  }

  @override
  List<Object?> get props => [
    name, email, uid,
    status, profileUrl, password
  ];

  UserEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? uid,
    String? status,
    String? profileUrl,
    String? password,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      uid: uid ?? this.uid,
      status: status ?? this.status,
      profileUrl: profileUrl ?? this.profileUrl,
      password: password ?? this.password,
    );
  }
}
