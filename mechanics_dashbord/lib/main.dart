import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mechanics_dashbord/consts/theme_data.dart';
import 'package:mechanics_dashbord/controllers/MenuControllerr.dart';
import 'package:mechanics_dashbord/firebase_options.dart';
import 'package:mechanics_dashbord/inner_screens/add_prod.dart';
import 'package:mechanics_dashbord/screens/main_screen.dart';
import 'package:provider/provider.dart';

import 'providers/dark_theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MechanicsDashboard());
}

class MechanicsDashboard extends StatefulWidget {
  const MechanicsDashboard({Key? key}) : super(key: key);

  @override
  State<MechanicsDashboard> createState() => _MechanicsDashboardState();
}

class _MechanicsDashboardState extends State<MechanicsDashboard> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: Center(
                    child: Text('App is being initialized'),
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: Center(
                    child: Text('An error has been occured ${snapshot.error}'),
                  ),
                ),
              ),
            );
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => MenuControllerr(),
              ),
              ChangeNotifierProvider(
                create: (_) {
                  return themeChangeProvider;
                },
              ),
            ],
            child: Consumer<DarkThemeProvider>(
              builder: (context, themeProvider, child) {
                return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Mechanics Dashboard',
                    theme:
                        Styles.themeData(themeProvider.getDarkTheme, context),
                    home: const MainScreen(),
                    routes: {
                      UploadProductForm.routeName: (context) =>
                          const UploadProductForm(),
                    });
              },
            ),
          );
        });
  }
}
