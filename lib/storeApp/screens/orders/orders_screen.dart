import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:thecodyapp/chatApp/screens/mobile_chat_screen_layout.dart';
import 'package:thecodyapp/chatApp/common/utils/colors.dart';
import 'package:thecodyapp/chatApp/common/utils/constants.dart';
import 'package:thecodyapp/storeApp/screens/orders/below_orders_app_bar.dart';
import 'package:thecodyapp/storeApp/widgets/empty_screen.dart';

import 'orders_widget.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/OrderScreen';

  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    // Size size = Utils(context).getScreenSize;
    bool isEmpty = true;
    if (isEmpty == true) {
      return const EmptyScreen(
        title: 'No Orders Have Been Made Yet!',
        subtitle: 'Order Something And Make Me Happy :)',
        buttonText: 'Shop Now',
        imagePath: 'assets/orders.png',
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          leading: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () =>
                Navigator.canPop(context) ? Navigator.pop(context) : null,
            child: const Icon(
              IconlyLight.arrowLeft2,
              color: tabLabelColor,
              size: 24,
            ),
          ),
          elevation: 0.25,
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: const Icon(
                  IconlyLight.chat,
                  color: tabLabelColor,
                  size: 30,
                ),
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MobileChatScreenLayout(),
                  ),
                ),
              ),
            ),
          ],
          title: Image.asset(
            Constants.storeAppBarLogo,
            height: 55,
          ),
        ),
        body: Column(
          children: [
            const BelowOrdersAppBar(),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (ctx, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                    child: OrderWidget(),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: Colors.white,
                    thickness: 1,
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }
}