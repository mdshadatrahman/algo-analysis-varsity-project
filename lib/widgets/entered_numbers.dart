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
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$number',
          ),
          GestureDetector(
            onTap: onRemove,
            child: const Icon(CupertinoIcons.xmark, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
