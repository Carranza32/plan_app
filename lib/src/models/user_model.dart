// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    int? id;
    String? uid;
    String? firstName;
    String? lastName;
    String? email;
    int? companyId;
    dynamic emailVerifiedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? fullName;
    List<Role>? roles;

    UserModel({
        this.id,
        this.uid,
        this.firstName,
        this.lastName,
        this.email,
        this.companyId,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.fullName,
        this.roles,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        uid: json["uid"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        companyId: json["company_id"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        fullName: json["full_name"],
        roles: json["roles"] == null ? [] : List<Role>.from(json["roles"]!.map((x) => Role.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "company_id": companyId,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "full_name": fullName,
        "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x.toJson())),
    };
}

class Role {
    int? id;
    dynamic teamId;
    String? name;
    String? guardName;
    String? context;
    DateTime? createdAt;
    DateTime? updatedAt;
    Pivot? pivot;

    Role({
        this.id,
        this.teamId,
        this.name,
        this.guardName,
        this.context,
        this.createdAt,
        this.updatedAt,
        this.pivot,
    });

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        teamId: json["team_id"],
        name: json["name"],
        guardName: json["guard_name"],
        context: json["context"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "team_id": teamId,
        "name": name,
        "guard_name": guardName,
        "context": context,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pivot": pivot?.toJson(),
    };
}

class Pivot {
    int? modelId;
    int? roleId;
    String? modelType;

    Pivot({
        this.modelId,
        this.roleId,
        this.modelType,
    });

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        modelId: json["model_id"],
        roleId: json["role_id"],
        modelType: json["model_type"],
    );

    Map<String, dynamic> toJson() => {
        "model_id": modelId,
        "role_id": roleId,
        "model_type": modelType,
    };
}
