import 'package:flutter/material.dart';
import 'package:uniapp/features/quizzes/views/widgets/quiz_question_card.dart';

class MicroStatus extends StatefulWidget {
  final bool isAnswering;
  final String? currentTranscript;

  const MicroStatus({
    super.key,
    required this.isAnswering,
    this.currentTranscript,
  });

  @override
  State<MicroStatus> createState() => _MicroStatusState();
}

class _MicroStatusState extends State<MicroStatus> {
  String _displayText = '';

  @override
  void didUpdateWidget(covariant MicroStatus oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!widget.isAnswering) {
      _displayText = 'Tap the microphone to answer by voice';
    } else if (widget.currentTranscript?.isEmpty ?? true) {
      _displayText = 'Speak now...';
    } else {
      _displayText = widget.currentTranscript!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(
            color:
                widget.isAnswering
                    ? primaryRed.withOpacity(0.3)
                    : Colors.grey.withOpacity(0.2),
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //? Status indicator row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.isAnswering ? Icons.mic : Icons.mic_none,
                  color: widget.isAnswering ? primaryRed : Colors.grey,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.isAnswering ? 'LISTENING...' : 'TAP MIC TO ANSWER',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: widget.isAnswering ? primaryRed : Colors.grey,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            //? Content area with animated text
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Text(
                  _displayText,
                  key: ValueKey(_displayText),
                  style: TextStyle(
                    fontSize: 16,
                    color: widget.isAnswering ? Colors.black87 : Colors.black54,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
