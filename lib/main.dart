// ignore_for_file: unnecessary_const
import 'package:flutter_application_1/View/DrawerPage/mywishlist_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/cart_provider.dart';
import 'package:provider/provider.dart';
import 'all_page.dart'; //lam` v cho no' nho? ra

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}
// SystemChrome.setSystemUIOverlayStyle(
//     const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChangeLayOut()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        Provider(create: (_) => FileController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, //tat cai' debug tren appbar
        title: 'DA Flutter',
        theme: ThemeData(
          //brightness: Brightness.dark, //che'do toi' hay sang'
          primarySwatch: Colors.indigo, //cai nen`cua title ngoai`
          appBarTheme: const AppBarTheme(color: Colors.white),
          //0xFF
          scaffoldBackgroundColor: const Color(0xFFe5e8ff),
          primaryTextTheme: Theme.of(context).primaryTextTheme.apply(bodyColor: Colors.indigo),
        ),
        home: const WellcomePage(),
        routes: {
          '/Wellcome': (context) => const WellcomePage(),
          '/Sign_In': (context) => const SignInPage(),
          '/Sign_Up': (context) => const SignUpPage(),
          '/Forgot': (context) => const ForgotPage(),
          '/Forgot_action': (context) => const ForgotAction(),
          '/Home': (context) => const HomePage(),
          '/Cart': (context) => const CartPage(),
          '/Pages': (context) => const Pages(),
          '/Setting': (context) => const SettingPage(),
          '/Support': (context) => const SupportPage(),
          '/MyProfile': (context) => const MyProfile(),
          '/EditMyProfile': (context) => const EditMyProfile(),
          '/Notifications': (context) => const Notifications(),
          '/ChangePW': (context) => const ChangePass(),
          '/PhonePage': (context) => const PhonePage(),
          '/LapTopPage': (context) => const LapTopPage(),
          '/BillingPage': (context) => const BillingInfomationPage(),
          '/SelectPaymentPage': (context) => const SelectPaymentPage(),
          '/SuccessfullyPage': (context) => const SuccessfullyPage(),
          '/QuanLyDonHangPage': (context) => const QuanLyDonHangPage(),
          '/MyWishlist': (context) => const MyWishlistPage(),
        },
        builder: EasyLoading.init(),
      ),
    );
    //);
  }
}
