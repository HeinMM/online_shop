import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shop/Auth/status.dart';
import 'package:online_shop/screens/hompage_screen.dart';
import 'package:online_shop/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Status()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isLogin = Provider.of<Status>(context);
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.grey,
         // fontFamily: 'Lato',
          textTheme: GoogleFonts.openSansTextTheme(
            Theme.of(context).textTheme,
          )),
      home: isLogin.getIsLogin() ? const HomePageScreen() : const LoginScreen(),
    );
  }
}
