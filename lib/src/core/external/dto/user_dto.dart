
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/user_entity.dart';

class UserDTO extends UserEntity {
  const UserDTO({
    super.name, 
    super.email, 
    super.uid, 
    super.status, 
    super.profileUrl, 
    super.password
  });

  factory UserDTO.fromJson(DocumentSnapshot snapshot) {
    final Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return UserDTO(
      name: data["name"],
      email: data["email"],
      uid: data["uid"],
      status: data["status"],
      profileUrl: data["profileUrl"],
      password: data["password"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name, 
      "email": email, 
      "uid": uid, 
      "status": status, 
      "profileUrl": profileUrl, 
      "password": password
    };
  }
}