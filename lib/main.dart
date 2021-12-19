import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:project_assignment_e/providers/cart_provider.dart';
import 'package:project_assignment_e/providers/products_provider.dart';
import 'package:project_assignment_e/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      DevicePreview(
        enabled: /* !kReleaseMode */ false,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'Project Assignment e',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
