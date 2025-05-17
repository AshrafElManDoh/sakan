import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counter = 0;

  void _increment() {
    setState(() {
      counter++;
    });
  }

  void _decrement() {
    if (counter > 0) {
      setState(() {
        counter--;
      });
    }
  }

  Widget circularButton(
      {required IconData icon,
      required VoidCallback? onTap,
      required bool enabled}) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: enabled ? Colors.black : kthirdColor,
            width: 1.5,
          ),
        ),
        child: Icon(
          icon,
          size: 20,
          color: enabled ? Colors.black : kthirdColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        circularButton(
          icon: Icons.remove,
          onTap: _decrement,
          enabled: counter > 0,
        ),
        const SizedBox(width: 16),
        SizedBox(
            width: 24,
            child: Center(
              child: Text(
                '$counter',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )),
        const SizedBox(width: 16),
        circularButton(
          icon: Icons.add,
          onTap: _increment,
          enabled: true,
        ),
      ],
    );
  }
}
