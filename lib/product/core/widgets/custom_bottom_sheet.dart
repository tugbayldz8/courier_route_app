import 'package:flutter/material.dart';

final class CustomBottomSheet {
  CustomBottomSheet._();

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
  }) {
    return showModalBottomSheet<T?>(
      
      useSafeArea: true,
      isScrollControlled: true,
      showDragHandle: true,
      enableDrag: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: child,
        );
      },
    );
  }
}
