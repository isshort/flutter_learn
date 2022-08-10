enum UniversityEnum {
  manas('Manas University'),
  polytechnic('Polytechnic University'),
  kabul('Kabul University'),
  wardak('Wardak University');

  final uniqueName;
  const UniversityEnum(this.uniqueName);
}

class UniversityModel {
  UniversityModel(this.name);

  final UniversityEnum name;
}
