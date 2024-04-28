import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable(
  includeIfNull: false
)
class Student {
  int id;

  @JsonKey(name: "first_name")
  String firstName;

  @JsonKey(name: "middle_name")
  String? middleName;

  @JsonKey(name: "last_name")
  String lastName;

  @JsonKey(name: "contact_number")
  String? contactNumber;

  String email;

  String? school;

  String? course;

  String? office;

  String? designation;

  String? uuid;

  @JsonKey(name: "year_level")
  int? yearLevel;

  Student(
      {required this.id,
      required this.firstName,
      this.middleName,
      required this.lastName,
      required this.email,
      this.contactNumber,
      this.school,
      this.office,
      this.designation,
      this.yearLevel,
      this.uuid});

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);

  @override
  String toString() {
    return "$firstName $lastName";
  }

  // double totalTrainees(){
  //   double total = 0.0;
  //   for(Trainee trainee in Trainee){
  //     total += product.price * product.quantity;
  //   }
  //   return total;
  // }
}