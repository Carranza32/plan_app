// To parse this JSON data, do
//
//     final projectModel = projectModelFromJson(jsonString);

import 'dart:convert';

ProjectModel projectModelFromJson(String str) => ProjectModel.fromJson(json.decode(str));

String projectModelToJson(ProjectModel data) => json.encode(data.toJson());

class ProjectModel {
    int? id;
    int? companyId;
    String? name;
    int? projectTypeId;
    int? isProposalStudy;
    List<String>? workingDaysJson;
    String? otVisualizationRange;
    int? isActive;
    int? createdBy;
    int? updatedBy;
    dynamic deletedBy;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    Pivot? pivot;

    ProjectModel({
        this.id,
        this.companyId,
        this.name,
        this.projectTypeId,
        this.isProposalStudy,
        this.workingDaysJson,
        this.otVisualizationRange,
        this.isActive,
        this.createdBy,
        this.updatedBy,
        this.deletedBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.pivot,
    });

    factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        id: json["id"],
        companyId: json["company_id"],
        name: json["name"],
        projectTypeId: json["project_type_id"],
        isProposalStudy: json["is_proposal_study"],
        workingDaysJson: json["working_days_json"] == null ? [] : List<String>.from(json["working_days_json"]!.map((x) => x)),
        otVisualizationRange: json["ot_visualization_range"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedBy: json["deleted_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "company_id": companyId,
        "name": name,
        "project_type_id": projectTypeId,
        "is_proposal_study": isProposalStudy,
        "working_days_json": workingDaysJson == null ? [] : List<dynamic>.from(workingDaysJson!.map((x) => x)),
        "ot_visualization_range": otVisualizationRange,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "pivot": pivot?.toJson(),
    };
}

class Pivot {
    int? userId;
    int? projectId;

    Pivot({
        this.userId,
        this.projectId,
    });

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        userId: json["user_id"],
        projectId: json["project_id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "project_id": projectId,
    };
}
