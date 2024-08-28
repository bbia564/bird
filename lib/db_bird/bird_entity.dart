import 'package:intl/intl.dart';

class BirdEntity {

  int id;
  DateTime createTime;
  int count;

  BirdEntity({
    required this.id,
    required this.createTime,
    required this.count,
  });

  factory BirdEntity.fromJson(Map<String, dynamic> json) {
    return BirdEntity(
      id: json['id'],
      createTime: DateTime.parse(json['createTime']),
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createTime': createTime.toIso8601String(),
      'count': count,
    };
  }

  String get createTimeStr {
    return DateFormat('yyyy / MM / dd').format(createTime);
  }

}