import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordWithCubitField extends StatelessWidget {
  const PasswordWithCubitField({super.key});

  final String password = "Password";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PasswordCubit(),
      child: BlocBuilder<PasswordCubit, bool>(
        builder: (context, state) {
          return TextField(
            obscureText: state,
            decoration: InputDecoration(
                labelText: password,
                suffixIcon: IconButton(
                  icon: Icon(state ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    context.read<PasswordCubit>().change();
                  },
                )),
          );
        },
      ),
    );
  }
}

class PasswordCubit extends Cubit<bool> {
  PasswordCubit() : super(true);

  void change() => emit(!state);
}
