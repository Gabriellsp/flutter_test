// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:flutter_tests/modules/search/domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  @override
  final String? title;
  @override
  final String? content;
  @override
  final String? img;

  ResultSearchModel({this.title, this.content, this.img});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'img': img,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
      title: map['title'],
      content: map['content'],
      img: map['img'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) =>
      ResultSearchModel.fromMap(json.decode(source));
}
