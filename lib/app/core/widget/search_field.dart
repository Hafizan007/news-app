import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../gen/assets.gen.dart';
import '../values/app_colors.dart';
import '../values/app_values.dart';
import 'field_decoration.dart';

class SearchField extends StatefulWidget {
  final String? hintText;
  final TextEditingController textController;
  final Function(String)? onChange;
  final bool readOnly;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Function()? onTap;
  final bool? enabled;
  final bool isLoading;

  const SearchField({
    Key? key,
    this.hintText,
    required this.textController,
    this.onChange,
    this.readOnly = false,
    this.keyboardType,
    this.inputFormatters,
    this.onTap,
    this.enabled,
    this.isLoading = false,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool _isFocused = false;

  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  Widget get _suffixIcon {
    if (widget.isLoading) {
      return const Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: SpinKitFadingCircle(
          color: AppColors.colorPrimary,
          size: 20,
        ),
      );
    } else if (widget.textController.text.isNotEmpty) {
      return GestureDetector(
        onTap: () {
          setState(() {
            widget.textController.clear();
            widget.onChange!('');
          });
        },
        child: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Icon(
            Icons.close,
            size: 24,
            color: AppColors.textColorPrimary,
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget? get _prefixIcon {
    return Assets.images.search.image(
      width: 24,
      height: 24,
      fit: BoxFit.contain,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onFocusChange: (isFocused) => setState(() => _isFocused = isFocused),
      child: TextFormField(
        maxLines: 1,
        readOnly: widget.readOnly,
        controller: widget.textController,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        textAlignVertical: TextAlignVertical.center,
        onTap: widget.onTap,
        enabled: widget.enabled,
        style: const TextStyle(
          fontSize: AppValues.mediumTextSize,
          fontWeight: FontWeight.w400,
          color: AppColors.textColorPrimary,
          leadingDistribution: TextLeadingDistribution.even,
          height: 2,
        ),
        onChanged: (value) {
          setState(() {});
          if (_debounce?.isActive ?? false) _debounce?.cancel();
          _debounce = Timer(const Duration(milliseconds: 500), () {
            if (widget.onChange != null) widget.onChange!(value);
          });
        },
        decoration: FieldDecoration(
          text: widget.textController.text,
          enableField: widget.enabled ?? true,
          isFocused: _isFocused,
        ).copyWith(
          hintText: widget.hintText,
          suffixIcon: _suffixIcon,
          prefixIcon: _prefixIcon,
          filled: true,
          prefixText: "  ",
        ),
      ),
    );
  }
}
