// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      id: (json['id'] as num).toInt(),
      firstName: json['first_name'] as String,
      middleName: json['middle_name'] as String?,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      contactNumber: json['contact_number'] as String?,
      school: json['school'] as String?,
      course: json['course'] as String?,
      office: json['office'] as String?,
      designation: json['designation'] as String?,
      yearLevel: (json['year_level'] as num?)?.toInt(),
      uuid: json['uuid'] as String?,
    );

Map<String, dynamic> _$StudentToJson(Student instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'first_name': instance.firstName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('middle_name', instance.middleName);
  val['last_name'] = instance.lastName;
  writeNotNull('contact_number', instance.contactNumber);
  val['email'] = instance.email;
  writeNotNull('school', instance.school);
  writeNotNull('course', instance.course);
  writeNotNull('office', instance.office);
  writeNotNull('designation', instance.designation);
  writeNotNull('uuid', instance.uuid);
  writeNotNull('year_level', instance.yearLevel);
  return val;
}
