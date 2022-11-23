import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;

  GroceryItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color[100],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Image.asset(
                imagePath,
                height: 64,
              ),
            ),
            Text(
              itemName,
              style: GoogleFonts.arvo(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            MaterialButton(
              onPressed: onPressed,
              color: color[800],
              child: Text(
                '\₹$itemPrice',
                style: GoogleFonts.arvo(
                  color: Colors.white,letterSpacing: 1
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
