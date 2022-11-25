// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "My Cart",
                  style: GoogleFonts.arvo(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: isLoading
                    ? value.cartItems.length == 0
                        ? Lottie.network(
                            'https://assets4.lottiefiles.com/private_files/lf30_cjoryulu.json',
                          )
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ListView.builder(
                              itemCount: value.cartItems.length,
                              padding: const EdgeInsets.all(12),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: ListTile(
                                      leading: Image.asset(
                                        value.cartItems[index][2],
                                        height: 36,
                                      ),
                                      title: Text(
                                        value.cartItems[index][0],
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      subtitle: Text(
                                        '₹' + value.cartItems[index][1],
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      trailing: IconButton(
                                        icon: const Icon(Icons.cancel),
                                        onPressed: () => Provider.of<CartModel>(
                                                context,
                                                listen: false)
                                            .removeItemFromCart(index),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                    : Column(
                        children: [
                          Lottie.network(
                            'https://assets2.lottiefiles.com/packages/lf20_svlw4qzf.json',
                            width: 200,
                            height: 200,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'No Data Found',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff7785DB),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(color: Colors.green[200]),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '\$${value.calculateTotal()}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green.shade200),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: const [
                            Text(
                              'Pay Now',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
