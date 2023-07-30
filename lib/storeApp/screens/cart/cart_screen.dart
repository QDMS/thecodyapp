import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:thecodyapp/chatApp/common/utils/colors.dart';
import 'package:thecodyapp/storeApp/consts/global_methods.dart';
import 'package:thecodyapp/storeApp/consts/utils.dart';
import 'package:thecodyapp/storeApp/providers/cart_provider.dart';
import 'package:thecodyapp/storeApp/screens/cart/cart_widget.dart';
import 'package:thecodyapp/storeApp/widgets/empty_screen.dart';
import 'package:thecodyapp/storeApp/widgets/text_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItemsList =
        cartProvider.getCartItems.values.toList().reversed.toList();
    return cartItemsList.isEmpty
        ? const EmptyScreen(
            title: 'Your Cart Is Empty',
            subtitle: 'Add Something And Make Me Happy :)',
            buttonText: 'Shop Now',
            imagePath: 'assets/cart.png',
          )
        : Scaffold(
            appBar: AppBar(
              title: TextWidget(
                text: 'Cart (${cartItemsList.length})',
                color: tabLabelColor,
                textSize: 22,
                isTitle: true,
              ),
              toolbarHeight: 36,
              elevation: 0.25,
              backgroundColor: appBarColor,
              automaticallyImplyLeading: false,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: () {
                      GlobalMethods.warningDialog(
                          title: 'Empty Your Cart?',
                          subtitle: 'Are You Sure?',
                          fct: () {
                            cartProvider.clearCart();
                          },
                          context: context);
                    },
                    icon: const Icon(
                      IconlyLight.delete,
                      color: tabLabelColor,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                _checkout(ctx: context),
                Expanded(
                  child: ListView.builder(
                      itemCount: cartItemsList.length,
                      itemBuilder: (ctx, index) {
                        return ChangeNotifierProvider.value(
                          value: cartItemsList[index],
                          child: CartWidget(
                            q: cartItemsList[index].quantity,
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
  }

  Widget _checkout({required BuildContext ctx}) {
    Size size = Utils(ctx).getScreenSize;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Row(
          children: [
            Material(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextWidget(
                      text: 'Order Now', color: Colors.white, textSize: 20),
                ),
              ),
            ),
            const Spacer(),
            FittedBox(
              child: TextWidget(
                text: 'Total: \$25.00',
                color: Colors.white,
                textSize: 18,
                isTitle: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
