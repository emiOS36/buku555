import 'package:buku_555_v2/constants/app_constants.dart';
import 'package:flutter/material.dart';

InputDecoration fieldDecoration(
  BuildContext context, {
  String? hint,
  TextStyle? hintStyle,
}) {
  final scheme = Theme.of(context).colorScheme;
  final border = OutlineInputBorder(
    borderRadius: AppSizes.borderRadius,
    borderSide: BorderSide.none,
  );

  return InputDecoration(
    hintText: hint,
    hintStyle: hintStyle ?? TextStyle(color: scheme.onSurfaceVariant),
    filled: true,
    fillColor: scheme.surfaceContainerHighest,
    contentPadding: const EdgeInsets.all(AppSizes.fieldPadding),
    border: border,
    focusedBorder: border,
    errorBorder: border.copyWith(borderSide: BorderSide(color: scheme.error)),
    focusedErrorBorder: border.copyWith(
      borderSide: BorderSide(color: scheme.error),
    ),
  );
}
