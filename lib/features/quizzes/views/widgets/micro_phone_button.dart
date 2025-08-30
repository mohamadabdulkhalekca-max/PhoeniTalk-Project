import 'package:flutter/material.dart';

class MicrophoneButton extends StatelessWidget {
  final bool isAnswering;
  final VoidCallback onPressed;
  static const Color primaryRed = Color(0xFFE53935);

  const MicrophoneButton({
    super.key,
    required this.isAnswering,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: primaryRed,
        child:
            isAnswering
                ? const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                )
                : const Icon(Icons.mic, size: 30, color: Colors.white),
      ),
    );
  }
}
