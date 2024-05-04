// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Register _$RegisterFromJson(Map<String, dynamic> json) => Register(
      id: (json['id'] as num?)?.toInt(),
      studentId: (json['student_id'] as num?)?.toInt(),
      courseId: (json['course_id'] as num?)?.toInt(),
      is_approved: json['is_approved'] as bool,
    );

Map<String, dynamic> _$RegisterToJson(Register instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('student_id', instance.studentId);
  writeNotNull('course_id', instance.courseId);
  val['is_approved'] = instance.is_approved;
  return val;
}
