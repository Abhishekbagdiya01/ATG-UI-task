import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleBar extends StatelessWidget {
  TitleBar({
    required this.title,
    this.fontSize,
    super.key,
  });
  String title;
  double? fontSize;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        title,
        style: GoogleFonts.lora(
            fontSize: fontSize ?? 24, fontWeight: FontWeight.bold),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            Text(
              "View all",
              style: GoogleFonts.inter(color: Colors.grey),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
