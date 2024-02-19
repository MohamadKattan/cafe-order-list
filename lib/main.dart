import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:request_list_task/controllers%20/orders_controller.dart';

import 'utils/helper_method.dart';
import 'views/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HelperMethod().getItems();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HelperMethod()),
        ChangeNotifierProvider(create: (_) => OrdersController())
      ],
      child: MaterialApp(
        title: 'Waiter order list',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
