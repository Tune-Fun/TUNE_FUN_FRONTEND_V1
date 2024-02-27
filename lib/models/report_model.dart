// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tunefun_front/core/enums/enums.dart';

@immutable
class ReportModel {
  final int id;
  final ReportType reportType;
  final String reporter;
  final String targetId;
  final String content;
  final DateTime createdAt;

  const ReportModel({
    required this.id,
    required this.reportType,
    required this.reporter,
    required this.targetId,
    required this.content,
    required this.createdAt,
  });

  ReportModel copyWith({
    int? id,
    ReportType? reportType,
    String? reporter,
    String? targetId,
    String? content,
    DateTime? createdAt,
  }) {
    return ReportModel(
      id: id ?? this.id,
      reportType: reportType ?? this.reportType,
      reporter: reporter ?? this.reporter,
      targetId: targetId ?? this.targetId,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'reportType': reportType.type,
      'reporter': reporter,
      'targetId': targetId,
      'content': content,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory ReportModel.fromMap(Map<String, dynamic> map) {
    return ReportModel(
      id: map['id'] as int,
      reportType: (map['type'] as String).toReportTypeEnum(),
      reporter: map['reporter'] as String,
      targetId: map['targetId'] as String,
      content: map['content'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReportModel.fromJson(String source) =>
      ReportModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReportModel(id: $id, reportType: $reportType, reporter: $reporter, targetId: $targetId, content: $content, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant ReportModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.reportType == reportType &&
        other.reporter == reporter &&
        other.targetId == targetId &&
        other.content == content &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        reportType.hashCode ^
        reporter.hashCode ^
        targetId.hashCode ^
        content.hashCode ^
        createdAt.hashCode;
  }
}
