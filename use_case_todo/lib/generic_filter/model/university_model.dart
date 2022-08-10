enum UniversityEnum {
  manas('Manas University'),
  polytechnic('Polytechnic University'),
  kabul('Kabul University'),
  wardak('Wardak University');

  final String uniqueName;
  const UniversityEnum(this.uniqueName);

  static List<String> get universityList =>
      UniversityEnum.values.map((e) => e.uniqueName).toList();
}

class UniversityModel {
  UniversityModel(this.name);

  final UniversityEnum name;
}
