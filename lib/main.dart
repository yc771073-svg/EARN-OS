import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/marketplace.dart';
void main(){ runApp(EarnApp()); }
class EarnApp extends StatelessWidget {
  @override Widget build(BuildContext context){
    return MaterialApp(debugShowCheckedModeBanner: false, title: 'EARN OS', theme: ThemeData(brightness: Brightness.dark, scaffoldBackgroundColor: EarnTheme.black, primaryColor: EarnTheme.gold), home: MarketplaceScreen());
  }
}
