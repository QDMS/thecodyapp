import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:thecodyapp/storeApp/consts/firebase_consts.dart';
import 'package:thecodyapp/storeApp/consts/global_methods.dart';
import 'package:thecodyapp/storeApp/providers/wishlist_provider.dart';

class HeartBTN extends StatelessWidget {
  const HeartBTN({Key? key, required this.productId, this.isInWishlist = false})
      : super(key: key);
  final String productId;
  final bool? isInWishlist;
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return GestureDetector(
      onTap: () {
        final User? user = authInstance.currentUser;
        if (user == null) {
          GlobalMethods.errorDialog(
              subtitle: 'No User Found, Please Sign In or Create An Account.',
              context: context);
          return;
        }
        wishlistProvider.addRemoveProductToWishlist(productId: productId);
      },
      child: Icon(
        isInWishlist != null && isInWishlist == true
            ? IconlyBold.heart
            : IconlyLight.heart,
        size: 22,
        color: isInWishlist != null && isInWishlist == true
            ? Colors.red
            : Colors.white,
      ),
    );
  }
}
