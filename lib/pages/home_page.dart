import 'package:ShopCart/components/grocery_item_tile.dart';
import 'package:ShopCart/model/cart_model.dart';
import 'package:ShopCart/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CartPage();
            },
          ),
        ),
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_bag),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0),
            // good morning
            const SizedBox(height: 4.0),

            // Lets order fresh items for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                height: 110,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 239, 39, 39), width: 4),
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xffFFF200),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Container(
                    child: Text(
                      textAlign: TextAlign.center,
                      "Yallah Einkaufen Moruk",
                      style: GoogleFonts.lexend(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xffEE1C25),
                          color: Color.fromARGB(255, 26, 96, 208),
                          decorationThickness: 2.0),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 24,
            ),

            // divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(
                thickness: 2,
              ),
            ),

            const SizedBox(height: 24),

            // fresh items + grid
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Lidl's beste Produkte",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: value.shopItems.length,
                    padding: EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.2,
                    ),
                    itemBuilder: (context, index) {
                      return GroceryItemTile(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        imagePath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false)
                              .addItemToCart(index);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
