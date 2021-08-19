import 'package:azkar/Pages/azkar_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AzkarCard extends StatelessWidget {
  final name;

  AzkarCard(this.name);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AzkarDetailsScreen(),
              settings: RouteSettings(
                arguments: name,
              ),
            ));
      },
      child: Hero(
        tag: name,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Colors.grey, width: 0.5)),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              name,
              style: GoogleFonts.lateef(
                textStyle: TextStyle(
                  color: const Color(0xFF1CE287),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          )),
        ),
      ),
    );
  }
}
