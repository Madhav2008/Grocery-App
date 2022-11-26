import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/Models/Cart_Model.dart';
import 'package:provider/provider.dart';

class CartItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;

  CartItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
    required this.onPressed,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: Image.asset(
            value.cartItems[index][2],
            height: 36,
          ),
          title: Text(
            value.cartItems[index][0],
            style: GoogleFonts.arvo(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            '₹' + value.cartItems[index][1],
            style: GoogleFonts.arvo(fontSize: 12),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () => Provider.of<CartModel>(context, listen: false)
                .removeItemFromCart(index),
          ),
        ),
      ),
    );
  }
}
