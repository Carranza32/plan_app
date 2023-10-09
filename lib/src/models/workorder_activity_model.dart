// To parse this JSON data, do
//
//     final workOrderActivityModel = workOrderActivityModelFromJson(jsonString);

import 'dart:convert';

WorkOrderActivityModel workOrderActivityModelFromJson(String str) => WorkOrderActivityModel.fromJson(json.decode(str));

String workOrderActivityModelToJson(WorkOrderActivityModel data) => json.encode(data.toJson());

class WorkOrderActivityModel {
    int? id;
    int? workOrderId;
    int? activityId;
    int? supervisorId;
    int? dailyAdvanceRate;
    dynamic createdBy;
    dynamic updatedBy;
    dynamic deletedBy;
    dynamic deletedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? originalInputToProject;
    String? newInputToProject;
    String? originalDailyAdvanceRate;
    DateTime? newEndDate;
    Estimations? estimations;
    Activity? activity;

    WorkOrderActivityModel({
        this.id,
        this.workOrderId,
        this.activityId,
        this.supervisorId,
        this.dailyAdvanceRate,
        this.createdBy,
        this.updatedBy,
        this.deletedBy,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.originalInputToProject,
        this.newInputToProject,
        this.originalDailyAdvanceRate,
        this.newEndDate,
        this.estimations,
        this.activity,
    });

    factory WorkOrderActivityModel.fromJson(Map<String, dynamic> json) => WorkOrderActivityModel(
        id: json["id"],
        workOrderId: json["work_order_id"],
        activityId: json["activity_id"],
        supervisorId: json["supervisor_id"],
        dailyAdvanceRate: json["daily_advance_rate"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedBy: json["deleted_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        originalInputToProject: json["original_input_to_project"],
        newInputToProject: json["new_input_to_project"],
        originalDailyAdvanceRate: json["original_daily_advance_rate"],
        newEndDate: json["new_end_date"] == null ? null : DateTime.parse(json["new_end_date"]),
        estimations: json["estimations"] == null ? null : Estimations.fromJson(json["estimations"]),
        activity: json["activity"] == null ? null : Activity.fromJson(json["activity"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "work_order_id": workOrderId,
        "activity_id": activityId,
        "supervisor_id": supervisorId,
        "daily_advance_rate": dailyAdvanceRate,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "original_input_to_project": originalInputToProject,
        "new_input_to_project": newInputToProject,
        "original_daily_advance_rate": originalDailyAdvanceRate,
        "new_end_date": newEndDate?.toIso8601String(),
        "estimations": estimations?.toJson(),
        "activity": activity?.toJson(),
    };
}

class Activity {
    int? id;
    int? projectId;
    String? name;
    int? parentId;
    String? level;
    int? isCriticalRoute;
    DateTime? startDate;
    DateTime? endDate;
    int? supervisorId;
    String? unit;
    String? quantity;
    dynamic createdBy;
    dynamic updatedBy;
    dynamic deletedBy;
    dynamic deletedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? lastDailyAdvanceRate;
    DateTime? lastEndDate;

    Activity({
        this.id,
        this.projectId,
        this.name,
        this.parentId,
        this.level,
        this.isCriticalRoute,
        this.startDate,
        this.endDate,
        this.supervisorId,
        this.unit,
        this.quantity,
        this.createdBy,
        this.updatedBy,
        this.deletedBy,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.lastDailyAdvanceRate,
        this.lastEndDate,
    });

    factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        projectId: json["project_id"],
        name: json["name"],
        parentId: json["parent_id"],
        level: json["level"],
        isCriticalRoute: json["is_critical_route"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        supervisorId: json["supervisor_id"],
        unit: json["unit"],
        quantity: json["quantity"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedBy: json["deleted_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        lastDailyAdvanceRate: json["last_daily_advance_rate"],
        lastEndDate: json["last_end_date"] == null ? null : DateTime.parse(json["last_end_date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "project_id": projectId,
        "name": name,
        "parent_id": parentId,
        "level": level,
        "is_critical_route": isCriticalRoute,
        "start_date": startDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
        "supervisor_id": supervisorId,
        "unit": unit,
        "quantity": quantity,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "last_daily_advance_rate": lastDailyAdvanceRate,
        "last_end_date": "${lastEndDate!.year.toString().padLeft(4, '0')}-${lastEndDate!.month.toString().padLeft(2, '0')}-${lastEndDate!.day.toString().padLeft(2, '0')}",
    };
}

class Estimations {
    int? duration;
    int? estimateProgress;
    double? addedProgress;

    Estimations({
        this.duration,
        this.estimateProgress,
        this.addedProgress,
    });

    factory Estimations.fromJson(Map<String, dynamic> json) => Estimations(
        duration: json["duration"],
        estimateProgress: json["estimate_progress"],
        addedProgress: json["added_progress"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "duration": duration,
        "estimate_progress": estimateProgress,
        "added_progress": addedProgress,
    };
}
