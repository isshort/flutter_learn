import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn/src/go_router_example/cubit/auth_cubit.dart';
import 'package:go_router/go_router.dart';

class GoHomePage extends StatelessWidget {
  const GoHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GoHomePage Title')),
      body: Column(children: [
        ElevatedButton(
          child: const Text("Go Home Page"),
          onPressed: () => context.go('/home1'),
        ),
        BlocConsumer<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return const CircularProgressIndicator();
            } else if (state is AuthError) {
              return Text('${state.message}');
            } else {
              return ElevatedButton(
                child: const Text('LogOut'),
                onPressed: () => context.read<AuthCubit>().logout(),
              );
            }
          },
          listenWhen: (previous, current) => current is AuthInitial,
          listener: (context, state) {
            return context.go('/login');
          },
        ),
        ElevatedButton(
          child: const Text("Register Page"),
          onPressed: () {},
        ),
      ]),
    );
  }
}
