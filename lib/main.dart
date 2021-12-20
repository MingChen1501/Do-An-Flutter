// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:provider/provider.dart';
=======
import 'package:flutter/services.dart';
>>>>>>> 9df0160887af07863e8f392035e66a77db60374a
import 'all_page.dart'; //lam` v cho no' nho? ra

void main() => runApp(const MyApp());
// SystemChrome.setSystemUIOverlayStyle(
//     const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChangeLayOut(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, //tat cai' debug tren appbar
        title: 'DA Flutter',
        theme: ThemeData(
          //brightness: Brightness.dark, //che'do toi' hay sang'
          primarySwatch: Colors.indigo, //cai nen`cua title ngoai`
          appBarTheme: const AppBarTheme(color: Colors.white),
          //0xFF
          scaffoldBackgroundColor: const Color(0xFFe5e8ff),
        ),
        home: const WellcomePage(),
        routes: {
          '/Sign_In': (context) => const SignInPage(),
          '/Sign_Up': (context) => const SignUpPage(),
          '/Forgot': (context) => const ForgotPage(),
          '/Forgot_action': (context) => const ForgotAction(),
          '/Home': (context) => const HomePage(),
          '/Cart': (context) => const CartPage(),
          '/Pages': (context) => const Loder(),
          '/Setting': (context) => const SettingPage(),
          '/Support': (context) => const SupportPage(),
          '/MyProfile': (context) => const MyProfile(),
          '/Notifications': (context) => const Notifications(),
          '/ChangePW': (context) => const ChangePass(),
          '/PhonePage':(context)=>const PhonePage(),
          '/LapTopPage':(context)=>const LapTopPage(),
        },
      ),
<<<<<<< HEAD
=======
      home: const WellcomePage(),
      routes: {
        '/Wellcome': (context) => const WellcomePage(),
        '/Sign_In': (context) => const SignInPage(),
        '/Sign_Up': (context) => const SignUpPage(),
        '/Forgot': (context) => const ForgotPage(),
        '/Forgot_action': (context) => const ForgotAction(),
        '/Home': (context) => const HomePage(),
        '/Cart': (context) => const CartPage(),
        '/Pages': (context) => const Loder(),
        '/Setting': (context) => const SettingPage(),
        '/Support': (context) => const SupportPage(),
        '/MyProfile': (context) => const MyProfile(),
        '/EditMyProfile': (context) => const EditMyProfile(),
        '/Notifications': (context) => const Notifications(),
        '/ChangePW': (context) => const ChangePass(),
        '/PhonePage': (context) => const PhonePage(),
        '/LapTopPage': (context) => const LapTopPage(),
      },
>>>>>>> 9df0160887af07863e8f392035e66a77db60374a
    );
  }
}

