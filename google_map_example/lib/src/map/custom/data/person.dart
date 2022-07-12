import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  final String firstName, lastName;
  final DateTime? dateOfBirth;

  Person(this.firstName, this.lastName, this.dateOfBirth);

  factory Person.fromJson(Map<String, dynamic> data) => _$PersonFromJson(data);
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
