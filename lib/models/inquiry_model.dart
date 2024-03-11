// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:tunefun_front/core/enums/enums.dart';

@immutable
class InquiryModel {
  final int id;
  final CategoryType category;
  final String inquiryContent;
  final String answerContent;
  final StatusType status;
  final String inQuirer;
  final DateTime createdAt;
  final DateTime answerAt;

  const InquiryModel({
    required this.id,
    required this.category,
    required this.inquiryContent,
    required this.answerContent,
    required this.status,
    required this.inQuirer,
    required this.createdAt,
    required this.answerAt,
  });

  InquiryModel copyWith({
    int? id,
    CategoryType? category,
    String? inquiryContent,
    String? answerContent,
    StatusType? status,
    String? inQuirer,
    DateTime? createdAt,
    DateTime? answerAt,
  }) {
    return InquiryModel(
      id: id ?? this.id,
      category: category ?? this.category,
      inquiryContent: inquiryContent ?? this.inquiryContent,
      answerContent: answerContent ?? this.answerContent,
      status: status ?? this.status,
      inQuirer: inQuirer ?? this.inQuirer,
      createdAt: createdAt ?? this.createdAt,
      answerAt: answerAt ?? this.answerAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category': category.type,
      'inquiryContent': inquiryContent,
      'answerContent': answerContent,
      'status': status.type,
      'inQuirer': inQuirer,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'answerAt': answerAt.millisecondsSinceEpoch,
    };
  }

  factory InquiryModel.fromMap(Map<String, dynamic> map) {
    return InquiryModel(
      id: map['id'] as int,
      category: (map['type'] as String).toCategoryTypeEnum(),
      inquiryContent: map['inquiryContent'] as String,
      answerContent: map['answerContent'] as String,
      status: (map['type'] as String).toStatusTypeEnum(),
      inQuirer: map['inQuirer'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      answerAt: DateTime.fromMillisecondsSinceEpoch(map['answerAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory InquiryModel.fromJson(String source) =>
      InquiryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InquiryModel(id: $id, category: $category, inquiryContent: $inquiryContent, answerContent: $answerContent, status: $status, inQuirer: $inQuirer, createdAt: $createdAt, answerAt: $answerAt)';
  }

  @override
  bool operator ==(covariant InquiryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.category == category &&
        other.inquiryContent == inquiryContent &&
        other.answerContent == answerContent &&
        other.status == status &&
        other.inQuirer == inQuirer &&
        other.createdAt == createdAt &&
        other.answerAt == answerAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        category.hashCode ^
        inquiryContent.hashCode ^
        answerContent.hashCode ^
        status.hashCode ^
        inQuirer.hashCode ^
        createdAt.hashCode ^
        answerAt.hashCode;
  }
}
