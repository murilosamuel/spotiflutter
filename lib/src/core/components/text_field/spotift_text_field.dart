import 'package:flutter/material.dart';
import 'package:spotiflutter/src/core/components/text_field/spotify_text_field_theme.dart';

class SpotifyTextField extends StatelessWidget {
  final SpotifyTextFieldTheme? theme;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final FormFieldValidator<String>? validator;
  final bool? enabled;
  final bool autofocus;
  final FocusNode? focusNode;
  final String? initialValue;
  final Iterable<String>? autofillHints;

  const SpotifyTextField({
    Key? key,
    this.controller,
    this.onChanged,
    this.onTap,
    this.theme,
    this.validator,
    this.enabled,
    this.autofocus = false,
    this.focusNode,
    this.initialValue,
    this.autofillHints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      controller: controller,
      maxLines: theme?.maxLines ?? 1,
      obscureText: theme?.obscureText ?? false,
      onChanged: (enabled ?? true) ? onChanged : null,
      initialValue: initialValue,
      keyboardType: theme?.keyboardType,
      onTap: onTap,
      readOnly: !(enabled ?? true),
      validator: validator,
      textCapitalization: theme?.textCapitalization ?? TextCapitalization.none,
      textInputAction: TextInputAction.next,
      inputFormatters: [
        ...theme?.inputFormatters ?? [],
      ],
      style: theme?.style,
      textAlign: theme?.textAlign ?? TextAlign.start,
      enabled: true,
      decoration: InputDecoration(
        contentPadding: theme?.contentPadding ?? const EdgeInsets.all(12),
        prefixIcon: theme?.prefix,
        suffixIcon: theme?.suffix,
        filled: true,
        isDense: theme?.isDense ?? true,
        fillColor: (enabled ?? true)
            ? Colors.grey.shade700
            : Colors.grey.shade200.withOpacity(0.75),
        hintText: theme?.hintText,
      ),
      focusNode: (enabled ?? true) ? focusNode : null,
      autofillHints: autofillHints != null ? autofillHints! : null,
    );
  }
}
