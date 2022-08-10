import 'package:use_case_todo/generic_filter/filter_view.dart';

enum UniversityEnum {
  manas('Manas University'),
  polytechnic('Polytechnic University'),
  kabul('Kabul University'),
  wardak('Wardak University');

  final String uniqueName;
  const UniversityEnum(this.uniqueName);

  static List<String> get universityList =>
      UniversityEnum.values.map((e) => e.uniqueName).toList();

  static List<UniversityModel> get models =>
      UniversityEnum.values.map(UniversityModel.new).toList();
}

class UniversityModel extends IFilter {
  UniversityModel(this.name);

  final UniversityEnum name;

  @override
  // TODO: implement id
  int get id => name.index;

  @override
  // TODO: implement key
  String get key => name.uniqueName;
}
