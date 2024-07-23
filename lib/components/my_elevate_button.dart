import 'package:flutter/material.dart';

class MyElevateButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Text textField;

  const MyElevateButton({
    required this.text,
    required this.onPressed,
    required this.textField,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
        child: textField,
      ),
      style: ElevatedButton.styleFrom(
        
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(color: Colors.grey, width: 1),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }
}
