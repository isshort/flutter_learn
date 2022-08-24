import 'package:flutter/material.dart';

import '../uikit.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPress,
    required this.title,
  });
  final VoidCallback? onPress;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: EmptyButtonStyle(),
      onPressed: onPress,
      child: SizedBox(
        height: CustomButtons.medium.size,
        child: DecoratedBox(
          decoration:
              CustomDecoration(colorScheme: Theme.of(context).colorScheme),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Theme.of(context).colorScheme.onError,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
