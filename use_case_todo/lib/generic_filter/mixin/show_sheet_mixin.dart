import 'package:flutter/material.dart';

mixin ShowSheetMixin {
  static Future<T?> showCustomBottomSheet<T>({
    required BuildContext context,
    required Widget child,
  }) async {
    return await showModalBottomSheet<T>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(34),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  const SizedBox(
                    width: 50,
                    child: Divider(thickness: 10),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
              Expanded(child: child),
            ],
          ),
        );
      },
    );
  }
}
