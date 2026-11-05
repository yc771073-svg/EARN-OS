import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'theme.dart';
import 'screens/world_selector.dart';
import 'screens/marketplace.dart';
import 'screens/delivery.dart';
import 'screens/settings.dart';
import 'screens/supplier_dashboard.dart';
import 'screens/ai_assistant.dart';
import 'screens/cart_order_screen.dart';
import 'screens/payment_world_screen.dart';

void main() { WidgetsFlutterBinding.ensureInitialized(); runApp(const EarnOSApp()); }

class EarnOSApp extends StatefulWidget { const EarnOSApp({super.key}); @override State<EarnOSApp> createState() => _EarnOSAppState(); }
class _EarnOSAppState extends State<EarnOSApp> {
  Locale _locale = const Locale('en');
  void setLocale(Locale locale) { setState(() => _locale = locale); }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EARN OS',
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: const [Locale('en'), Locale('fr'), Locale('bm'), Locale('ar'), Locale('tr')],
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
      theme: EarnTheme.luxury,
      darkTheme: EarnTheme.luxury,
      themeMode: ThemeMode.dark,
      home: MainShell(onLocaleChange: setLocale),
    );
  }
}

class MainShell extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  const MainShell({super.key, required this.onLocaleChange});
  @override State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    final screens = [
      WorldSelectorScreen(onLocaleChange: widget.onLocaleChange),
      const MarketplaceScreen(),
      const SupplierDashboardScreen(),
      const CartOrderScreen(),
      const PaymentWorldScreen(),
      const DeliveryScreen(),
      const AIAssistantScreen(),
      SettingsScreen(onLocaleChange: widget.onLocaleChange),
    ];
    return Scaffold(
      backgroundColor: EarnTheme.black,
      body: screens[_index],
      floatingActionButton: _index == 6 ? null : FloatingActionButton(backgroundColor: const Color(0xFFD4AF37), onPressed: () => setState(() => _index = 6), child: const Icon(Icons.smart_toy, color: Colors.black, size: 28)),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: EarnTheme.black, border: Border(top: BorderSide(color: EarnTheme.gold.withOpacity(0.4)))),
        child: NavigationBar(
          backgroundColor: Colors.transparent,
          indicatorColor: EarnTheme.gold.withOpacity(0.2),
          selectedIndex: _index,
          onDestinationSelected: (i) => setState(() => _index = i),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home, color: Color(0xFFD4AF37)), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.public, color: Color(0xFFD4AF37)), label: 'Explore'),
            NavigationDestination(icon: Icon(Icons.store, color: Color(0xFFD4AF37)), label: 'Brands'),
            NavigationDestination(icon: Icon(Icons.shopping_bag, color: Color(0xFFD4AF37)), label: 'Cart'),
            NavigationDestination(icon: Icon(Icons.credit_card, color: Color(0xFFD4AF37)), label: 'Pay'),
            NavigationDestination(icon: Icon(Icons.delivery_dining, color: Color(0xFFD4AF37)), label: 'Delivery'),
            NavigationDestination(icon: Icon(Icons.smart_toy, color: Color(0xFFD4AF37)), label: 'EARN AI'),
            NavigationDestination(icon: Icon(Icons.person, color: Color(0xFFD4AF37)), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
