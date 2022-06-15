import 'dart:math';

import 'family.dart';

/// the repository
class Repository {
  /// a random number genrator
  static final Random rnd = Random();

  /// Get the familes data
  Future<List<Family>> getFamilies() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return Families.data;
  }

  /// Gets a family from the repository

  Future<Family> getFamily(String fid) async => (await getFamilies()).family(fid);
}

class Repository2 {
  Repository2._(this.userName);

  final String userName;

  /// Get Repository with the usernames
  static Future<Repository2> get(String username) async {
    await oneSecondDeloyed();
    return Repository2._(username);
  }

  /// Random generator
  static final Random rnd = Random();

  /// Get Families Data
  Future<List<Family>> getFamilies() async {
    await oneSecondDeloyed();
    return Families.data;
  }

  Future<Family> getFamily(String fid) async => (await getFamilies()).family(fid);

  /// Get Person from Family
  Future<FamilyPerson> getPerson(String fid, pid) async {
    final Family family = await getFamily(fid);

    return FamilyPerson(family: family, person: family.person(pid));
  }
}

Future<void> oneSecondDeloyed() async {
  return await Future<void>.delayed(const Duration(seconds: 1));
}
