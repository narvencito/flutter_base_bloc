// ignore_for_file: lines_longer_than_80_chars, sort_constructors_first

import 'dart:convert';

class AngedModel {
  AngedModel({
    required this.letter,
    required this.view,
  });

  String letter;
  bool view = false;

  Map<String, dynamic> toMap() {
    return {
      'letter': letter,
      'view': view,
    };
  }

  factory AngedModel.fromMap(Map<String, dynamic> map) {
    return AngedModel(
      letter: (map['letter'] ?? '') as String,
      view: (map['view'] ?? false) as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AngedModel.fromJson(String source) => AngedModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
