import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnteredNumber extends StatelessWidget {
  const EnteredNumber({
    super.key,
    required this.number,
    required this.onRemove,
  });
  final int number;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$number',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: onRemove,
            child: const Icon(
              CupertinoIcons.xmark,
              color: Colors.black54,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
