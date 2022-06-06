// void main() {
//   blocTest<HomeCubit, HomeState>(
//     'home cubit test',
//     build: HomeCubit.new,
//     act: (cubit) => cubit.change(2),
//     expect: () => [const HomeState(pageIndex: 2)],
//   );
// }

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_learn/src/feature/password_cubit/password.dart';

void main() {
  blocTest<PasswordCubit, bool>(
    'password cubit test',
    build: () => PasswordCubit(),
    act: ((bloc) => bloc.change()),
    expect: () => [true],
  );
}
