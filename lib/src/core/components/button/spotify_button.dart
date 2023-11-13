import 'package:flutter/material.dart';
import 'package:spotiflutter/src/core/components/button/spotify_button_state.dart';

class SpotifyButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final Color? color;
  final bool disabled;
  final SpotifyButtonState state;

  const SpotifyButton({
    Key? key,
    this.text,
    this.disabled = false,
    this.color,
    this.state = SpotifyButtonState.initial,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case SpotifyButtonState.initial:
        return SizedBox(
          child: ElevatedButton(
            onPressed: disabled ? null : onPressed,
            style: _buttonStyle,
            child: Text(text ?? ''),
          ),
        );
      case SpotifyButtonState.loading:
        return SizedBox(
          child: ElevatedButton(
            onPressed: () {},
            style: _buttonStyle,
            child: const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: Colors.white,
              ),
            ),
          ),
        );
    }
  }

  ButtonStyle get _buttonStyle => ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 32,
        ),
        primary: color,
        shape: RoundedRectangleBorder(
          // Change your radius here
          borderRadius: BorderRadius.circular(100),
        ),
      );
}
