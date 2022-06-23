import 'package:flutter_learn/go_router/loading/data/person.dart';

class Family {
  Family({required this.id, required this.name, required this.people});

  final String id;
  final String name;
  final List<Person> people;

  ///  Get the [Person] with the given id in this family
  Person person(String pid) => people.singleWhere(
        (Person p) => p.id == pid,
        orElse: () => throw Exception('unknown person $pid for family $id'),
      );
}

class Families {
  Families._();

  static final List<Family> data = <Family>[
    Family(
      id: 'f1',
      name: 'Wahidi',
      people: <Person>[
        Person(id: 'p1', name: 'Nematullah', age: 24),
        Person(id: 'p2', name: 'Hikmatullah', age: 26),
        Person(id: 'p3', name: 'Sebghatullah', age: 22),
        Person(id: 'p3', name: 'Elyas', age: 13),
        Person(id: 'p4', name: 'Rahmatullah', age: 34),
      ],
    ),
    Family(
      id: 'f2',
      name: 'Shaidi',
      people: <Person>[
        Person(id: 'p1', name: 'Ibrahim', age: 38),
        Person(id: 'p2', name: 'Abdurahman', age: 10),
        Person(id: 'p3', name: 'Yaser', age: 6),
        Person(id: 'p3', name: 'kulthum', age: 8),
      ],
    ),
    Family(
      id: 'f3',
      name: 'Wahaj',
      people: <Person>[
        Person(id: 'p1', name: 'Mustafa', age: 32),
        Person(id: 'p2', name: 'Hajwa', age: 5),
        Person(id: 'p3', name: 'Aliya', age: 28),
      ],
    ),
  ];

  static Family family(String fid) => data.family(fid);
}

extension FamilyExtension on List<Family> {
  Family family(String fid) => singleWhere(
        (Family f) => f.id == fid,
        orElse: () => throw Exception('unknow familly $fid'),
      );
}

/// The relation of person in family
class FamilyPerson {
  /// The family
  final Family family;
  // the Person
  final Person person;

  /// Creates a [FamilyPerson]
  FamilyPerson({required this.family, required this.person});
}
