import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter/services.dart';
// import 'package:proto/screens/change_add_screen.dart';
  // import 'package:proto/screens/checkout_screen.dart';
// import 'package:proto/screens/add_card_screen.dart';
// import 'package:proto/screens/more_screen.dart';
// import 'package:proto/screens/my_order_screen.dart';

// import 'screens/checkout_msg_screen.dart';
// import 'screens/map_screen.dart';

// import 'package:proto/screens/notifications_screen.dart';
// import 'package:proto/screens/payment_details_screen.dart';
// import 'package:proto/screens/home_screen.dart';
// import 'package:proto/screens/login_screen.dart';
// import 'package:proto/screens/main_tab_screen.dart';
// import 'package:proto/screens/offer_screen.dart';
// import 'package:proto/screens/on_board_screen.dart';
// import 'package:proto/screens/profile_screen.dart';
// import 'package:proto/screens/signup_screen.dart';
import 'package:proto/screens/splash_screen.dart';
// import 'package:proto/screens/welcome_screen.dart';
// import 'package:proto/widgets/offers_carousel.dart';
// import 'screens/menu_item_detail_screen.dart';
// import 'screens/menu_items_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Makes it transparent (Android)
      statusBarIconBrightness:
          Brightness.dark, // Dark icons for light backgrounds
    ),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          // WelcomeScreen(),
          SplashScreen(),
          //  HomeScreen(),
          // LoginScreen(),
          // SignupScreen(),
          // OnBoardScreen(),
          // MainTabScreen(),
          // OffersCarousel(),
          // MenuScreen(),
          // MenuItemScreen(),
          // MenuItemDetailScreen(),
          // OfferScreen(),
          // ProfileScreen(),
          // MoreScreen(),
          // NotificationsScreen(),
          // AddCardScreen(),
          // MyOrderScreen(),
          // PaymentDetailsScreen(),
          // CheckoutMsgScreen(),
          // ChangeAddScreen(),
          // CheckoutScreen(),

      // MspScreen(),
      theme: ThemeData(fontFamily: "Noto Kufi Arabic"),
    );
  }
}
