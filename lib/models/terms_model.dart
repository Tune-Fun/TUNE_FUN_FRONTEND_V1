// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class TermsModel {
  final int id;
  final int order;
  final String category;
  final String content;

  const TermsModel({
    required this.id,
    required this.order,
    required this.category,
    required this.content,
  });

  TermsModel copyWith({
    int? id,
    int? order,
    String? category,
    String? content,
  }) {
    return TermsModel(
      id: id ?? this.id,
      order: order ?? this.order,
      category: category ?? this.category,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'order': order,
      'category': category,
      'content': content,
    };
  }

  factory TermsModel.fromMap(Map<String, dynamic> map) {
    return TermsModel(
      id: map['id'] as int,
      order: map['order'] as int,
      category: map['category'] as String,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TermsModel.fromJson(String source) =>
      TermsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TermsModel(id: $id, order: $order, category: $category, content: $content)';
  }

  @override
  bool operator ==(covariant TermsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.order == order &&
        other.category == category &&
        other.content == content;
  }

  @override
  int get hashCode {
    return id.hashCode ^ order.hashCode ^ category.hashCode ^ content.hashCode;
  }
}
