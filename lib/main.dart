import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'theme.dart';
import 'widgets/earn_logo.dart';
import 'screens/world_selector.dart';
import 'screens/marketplace.dart';
import 'screens/delivery.dart';
import 'screens/settings.dart';
import 'screens/supplier_dashboard.dart';
import 'screens/ai_assistant.dart';
import 'screens/cart_order_screen.dart';
import 'screens/payment_world_screen.dart';
void main() { WidgetsFlutterBinding.ensureInitialized(); runApp(const EarnOSApp()); }
class EarnOSApp extends StatefulWidget { const EarnOSApp({super.key}); @override State<EarnOSApp> createState()=>_AppState(); }
class _AppState extends State<EarnOSApp> {
  Locale _locale = const Locale('fr');
  void setLocale(Locale l){ setState(()=>_locale=l); }
  @override Widget build(BuildContext context){
    return MaterialApp(title:'EARN OS', debugShowCheckedModeBanner:false, locale:_locale,
      supportedLocales: const [Locale('en'), Locale('fr'), Locale('bm'), Locale('ar'), Locale('tr'), Locale('es'), Locale('pt'), Locale('de'), Locale('it'), Locale('zh'), Locale('wo'), Locale('ha')],
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
      theme: EarnTheme.luxury, darkTheme: EarnTheme.luxury, themeMode: ThemeMode.dark, home: MainShell(onLocaleChange: setLocale));
  }
}
class MainShell extends StatefulWidget { final Function(Locale) onLocaleChange; const MainShell({super.key, required this.onLocaleChange}); @override State<MainShell> createState()=>_ShellState(); }
class _ShellState extends State<MainShell> {
  int _index=0;
  @override Widget build(BuildContext context){
    final screens=[WorldSelectorScreen(onLocaleChange: widget.onLocaleChange), const MarketplaceScreen(), const SupplierDashboardScreen(), const CartOrderScreen(), const PaymentWorldScreen(), const DeliveryScreen(), const AIAssistantScreen(), SettingsScreen(onLocaleChange: widget.onLocaleChange)];
    return Scaffold(backgroundColor: EarnTheme.black,
      appBar: AppBar(backgroundColor: EarnTheme.black, elevation:0, title: EarnLogo(size:32), actions:[
        IconButton(icon: Icon(Icons.notifications_none, color: EarnTheme.gold), onPressed: (){}),
        GestureDetector(onTap: ()=>setState(()=>_index=7), child: Container(margin: EdgeInsets.only(right:12), child: CircleAvatar(radius:18, backgroundColor: Color(0xFFFFD600), child: Text('Y', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))))),
      ]),
      body: screens[_index],
      floatingActionButton: _index==6?null:FloatingActionButton(backgroundColor: EarnTheme.gold, onPressed: ()=>setState(()=>_index=6), child: Icon(Icons.smart_toy, color: Colors.black, size:28)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(decoration: BoxDecoration(color: EarnTheme.black, border: Border(top: BorderSide(color: EarnTheme.gold.withOpacity(0.5)))), child: BottomNavigationBar(backgroundColor: Colors.transparent, type: BottomNavigationBarType.fixed, selectedItemColor: EarnTheme.gold, unselectedItemColor: Colors.white60, selectedFontSize: 10, unselectedFontSize: 10, currentIndex: _index, onTap: (i)=>setState(()=>_index=i), items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Explore'),
        BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Brands'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: 'Pay'),
        BottomNavigationBarItem(icon: Icon(Icons.delivery_dining), label: 'Delivery'),
        BottomNavigationBarItem(icon: Icon(Icons.smart_toy), label: 'EARN AI'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ])),
    );
  }
}
