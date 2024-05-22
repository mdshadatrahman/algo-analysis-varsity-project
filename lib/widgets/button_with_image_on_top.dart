import 'package:flutter/cupertino.dart';

class ButtonWithImageOnTop extends StatelessWidget {
  const ButtonWithImageOnTop({
    super.key,
    required this.imagePath,
    required this.buttonText,
    required this.onPressed,
  });

  final String imagePath;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imagePath),
            ),
          ),
        ),
        const SizedBox(height: 10),
        CupertinoButton.filled(
          onPressed: onPressed,
          child: Text(buttonText),
        ),
      ],
    );
  }
}
