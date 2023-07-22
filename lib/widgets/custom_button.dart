import 'package:atg_task_1/widgets/text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.imgPath,
    required this.text,
    super.key,
  });
  String imgPath;
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: MediaQuery.sizeOf(context).width * 0.45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(imgPath),
          Text(
            text,
            style: interText(),
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color.fromARGB(255, 89, 138, 237))),
    );
  }
}
