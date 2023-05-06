
import 'package:flutter/material.dart';
import 'package:mechanics/provider/orders_provider.dart';
import 'package:mechanics/screens/orders/orders_widget.dart';
import 'package:mechanics/services/utils.dart';
import 'package:mechanics/widget/back_widget.dart';
import 'package:mechanics/widget/empty_screen.dart';
import 'package:provider/provider.dart';

import '../../widget/text_widget.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/OrderScreen';

  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    // Size size = Utils(context).getScreenSize;
    final ordersProvider = Provider.of<OrdersProvider>(context);
    final ordersList = ordersProvider.getOrders;
    return FutureBuilder(
        future: ordersProvider.fetchOrders(),
        builder: (context, snapshot) {
          return ordersList.isEmpty
              ? const EmptyScreen(
                  title: 'You didnt place any order yet',
                  subtitle: 'order something and make me happy :)',
                  buttonText: 'Shop now',
                  imagePath: 'assets/images/box.png',
                )
              : Scaffold(
                  appBar: AppBar(
                    leading: const BackWidget(),
                    elevation: 0,
                    centerTitle: false,
                    title: TextWidget(
                      text: 'Your orders (${ordersList.length})',
                      color: color,
                      textSize: 24.0,
                      isTitle: true,
                    ),
                    backgroundColor: Theme.of(context)
                        .scaffoldBackgroundColor
                        .withOpacity(0.9),
                  ),
                  body: ListView.separated(
                    itemCount: ordersList.length,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 6),
                        child: ChangeNotifierProvider.value(
                          value: ordersList[index],
                          child: const OrderWidget(),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: color,
                        thickness: 1,
                      );
                    },
                  ));
        });
  }
}
