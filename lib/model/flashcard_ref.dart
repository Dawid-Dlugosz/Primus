import 'package:cloud_firestore/cloud_firestore.dart';

class FlashcardRef {
  FlashcardRef({required this.ref, required this.name});

  final DocumentReference<Object?> ref;
  final String name;

  factory FlashcardRef.fromJson(Map<String, dynamic> json) {
    return FlashcardRef(
      ref: json['ref'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['ref'] = ref;
    json['name'] = name;
    return json;
  }
}
