import 'package:flutter/material.dart';

// ignore: camel_case_types
class quizError extends StatelessWidget {
  const quizError({
    super.key,
    required this.errorMessage,
    required this.primaryRed,
    this.onTap,
  });

  final String? errorMessage;
  final Color primaryRed;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                errorMessage!,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryRed,
                  foregroundColor: Colors.white,
                ),
                onPressed: onTap,
                child: const Text('Try Again'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
