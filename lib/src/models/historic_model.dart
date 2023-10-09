// To parse this JSON data, do
//
//     final historicModel = historicModelFromJson(jsonString);

import 'dart:convert';

HistoricModel historicModelFromJson(String str) => HistoricModel.fromJson(json.decode(str));

String historicModelToJson(HistoricModel data) => json.encode(data.toJson());

class HistoricModel {
    int? id;
    int? projectId;
    String? orderNumber;
    DateTime? startDate;
    DateTime? endDate;
    String? status;
    int? createdBy;
    int? updatedBy;
    dynamic deletedBy;
    dynamic deletedAt;
    DateTime? createdAt;
    DateTime? updatedAt;

    HistoricModel({
        this.id,
        this.projectId,
        this.orderNumber,
        this.startDate,
        this.endDate,
        this.status,
        this.createdBy,
        this.updatedBy,
        this.deletedBy,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
    });

    factory HistoricModel.fromJson(Map<String, dynamic> json) => HistoricModel(
        id: json["id"],
        projectId: json["project_id"],
        orderNumber: json["order_number"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        status: json["status"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedBy: json["deleted_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "project_id": projectId,
        "order_number": orderNumber,
        "start_date": startDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
        "status": status,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
