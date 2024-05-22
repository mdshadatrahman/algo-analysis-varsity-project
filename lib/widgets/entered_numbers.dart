import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnteredNumber extends StatelessWidget {
  const EnteredNumber({
    super.key,
  });

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
          const Text(
            '12',
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(CupertinoIcons.xmark, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
