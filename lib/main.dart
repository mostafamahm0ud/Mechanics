import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mechanics/fetch_screen.dart';
import 'package:mechanics/firebase_options.dart';
import 'package:mechanics/inner_screens/category_screen.dart';
import 'package:mechanics/inner_screens/feeds_screen.dart';
import 'package:mechanics/inner_screens/product_detiails.dart';
import 'package:mechanics/provider/cart_provider.dart';
import 'package:mechanics/provider/orders_provider.dart';
import 'package:mechanics/provider/products_provider.dart';
import 'package:mechanics/provider/viewed_provider.dart';
import 'package:mechanics/screens/contact_us.dart';
import 'package:mechanics/provider/wishlist_products_provider.dart';
import 'package:mechanics/screens/auth/forget_pass.dart';
import 'package:mechanics/screens/auth/login.dart';
import 'package:mechanics/screens/auth/regisrer.dart';
import 'package:mechanics/screens/orders/orders_screen.dart';
import 'package:mechanics/screens/viewed_recently/viewed_recently.dart';
import 'package:mechanics/screens/wishlist/wishlist_screen.dart';
import 'package:provider/provider.dart';

import 'consts/theme_date.dart';
import 'provider/dark_theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MechanicsApp());
  });
}

class MechanicsApp extends StatefulWidget {
  const MechanicsApp({Key? key}) : super(key: key);

  @override
  State<MechanicsApp> createState() => _MechanicsAppState();
}

class _MechanicsAppState extends State<MechanicsApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  final Future<FirebaseApp> _firebaseInitialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _firebaseInitialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                  body: Center(
                child: CircularProgressIndicator(),
              )),
            );
          } else if (snapshot.hasError) {
            const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                  body: Center(
                child: Text('An error occured'),
              )),
            );
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) {
                return themeChangeProvider;
              }),
              ChangeNotifierProvider(
                create: (_) => ProductsProvider(),
              ),
              ChangeNotifierProvider(
                create: (_) => CartProvider(),
              ),
              ChangeNotifierProvider(
                create: (_) => WishlistProvider(),
              ),
              ChangeNotifierProvider(
                create: (_) => ViewedProdProvider(),
              ),
              ChangeNotifierProvider(
                create: (_) => OrdersProvider(),
              ),
            ],
            child: Consumer<DarkThemeProvider>(
                builder: (context, themeProvider, child) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Mechanics App',
                  theme: Styles.themeData(themeProvider.getDarkTheme, context),
                  home: const FetchScreen(),
                  routes: {
                    FeedsScreen.routeName: (ctx) => const FeedsScreen(),
                    ProductDetails.routeName: (ctx) => const ProductDetails(),
                    WishlistScreen.routeName: (ctx) => const WishlistScreen(),
                    OrdersScreen.routeName: (ctx) => const OrdersScreen(),
                    ViewedRecentlyScreen.routeName: (ctx) =>
                        const ViewedRecentlyScreen(),
                    ContactUsScreen.routeName: (ctx) => const ContactUsScreen(),
                    RegisterScreen.routeName: (ctx) => const RegisterScreen(),
                    LoginScreen.routeName: (ctx) => const LoginScreen(),
                    ForgetPasswordScreen.routeName: (ctx) =>
                        const ForgetPasswordScreen(),
                    CategoryScreen.routeName: (ctx) => const CategoryScreen(),
                  });
            }),
          );
        });
  }
}
