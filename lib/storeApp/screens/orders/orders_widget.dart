import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:thecodyapp/storeApp/consts/global_methods.dart';
import 'package:thecodyapp/storeApp/consts/utils.dart';
import 'package:thecodyapp/storeApp/inner_screens/product_details.dart';
import '../../widgets/text_widget.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({Key? key}) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return ListTile(
      subtitle: const Text('Paid: \$12.8'),
      onTap: () {
        GlobalMethods.navigateTo(
            ctx: context, routeName: ProductDetails.routeName);
      },
      leading:  ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: FancyShimmerImage(
            width: size.width * 0.2,
            imageUrl: 'https://cdn.pixabay.com/photo/2020/07/01/04/45/cbd-oil-5358405_1280.jpg',
            boxFit: BoxFit.fill,
          ),
      ),
      
      title: TextWidget(text: 'Title  x12', color: Colors.white, textSize: 18),
      trailing: TextWidget(text: '03/08/2022', color: Colors.white, textSize: 18),
    );
  }
}