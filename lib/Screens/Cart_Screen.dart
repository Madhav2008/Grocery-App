// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/Components/Cart_Item_Tile.dart';
import 'package:grocery_app/Models/Cart_Model.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEmpty = false;
    bool isLoading = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
      ),
      body: CartBody(itemName: itemName, itemPrice: itemPrice, imagePath: imagePath, color: color, onPressed: onPressed)
    );
  }
}
