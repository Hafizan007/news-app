import 'package:flutter/material.dart';

import '../../core/values/app_colors.dart';

class FieldDecoration extends InputDecoration {
  final String text;
  final bool readOnly;
  final bool enableField;
  final bool isFieldError;
  final bool isFocused;
  final bool enableFillColor;

  const FieldDecoration({
    required this.text,
    this.readOnly = false,
    this.enableField = true,
    this.isFieldError = false,
    this.isFocused = false,
    this.enableFillColor = true,
  });

  Color get _enableBorder {
    return AppColors.fieldBorderColor;
  }

  Color get _fillColor {
    return AppColors.fieldPrimaryColor;
  }

  bool _isFilled() {
    var result = false;
    if (text.trim().isNotEmpty || readOnly || !enabled) {
      result = true;
    }

    return result;
  }

  Color get _focusColor {
    return AppColors.colorPrimary;
  }

  @override
  String? get prefixText => "  ";

  @override
  bool get enabled => enableField;

  @override
  String? get counterText => "";

  @override
  bool get isCollapsed => true;

  @override
  bool? get isDense => true;

  @override
  bool? get filled => _isFilled();

  @override
  Color? get fillColor => _fillColor;

  @override
  EdgeInsetsGeometry? get contentPadding {
    return const EdgeInsets.fromLTRB(0, 8, 8, 8);
  }

  @override
  InputBorder? get border {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    );
  }

  @override
  InputBorder? get enabledBorder {
    return OutlineInputBorder(
      borderSide: BorderSide(color: _enableBorder),
      borderRadius: const BorderRadius.all(Radius.circular(4)),
    );
  }

  @override
  InputBorder? get focusedBorder {
    return OutlineInputBorder(
      borderSide: BorderSide(color: _focusColor),
      borderRadius: const BorderRadius.all(Radius.circular(4)),
    );
  }

  @override
  BoxConstraints? get prefixIconConstraints {
    return const BoxConstraints(
      maxWidth: 40,
      minWidth: 40,
    );
  }

  @override
  BoxConstraints? get suffixIconConstraints {
    return const BoxConstraints(
      maxWidth: 40,
      minWidth: 40,
    );
  }

  @override
  String? get errorText {
    if ((super.errorText ?? "").isNotEmpty) return "⚠ ${super.errorText}";

    return null;
  }

  @override
  int? get errorMaxLines => 3;

  @override
  int? get helperMaxLines => 3;
}
