import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'theme.dart';
import 'screens/marketplace.dart';
import 'screens/settings.dart';
import 'screens/ai_assistant.dart';
import 'screens/cart_order_screen.dart';
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
    // 4 ONGLETS SEULEMENT - PAS DE DELIVERY, PAS DE PAY, PAS DE EARN AI EN BAS
    // Home | Explore | Cart | Profile
    final screens=[const MarketplaceScreen(), const MarketplaceScreen(), const CartOrderScreen(), SettingsScreen(onLocaleChange: widget.onLocaleChange)];
    return Scaffold(backgroundColor: EarnTheme.black,
      appBar: AppBar(backgroundColor: EarnTheme.black, elevation:0,
        // PARAMETRES EN HAUT A GAUCHE - COMME TU AS DEMANDE
        leading: IconButton(icon: Icon(Icons.settings, color: EarnTheme.gold, size:26), onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>SettingsScreen(onLocaleChange: widget.onLocaleChange)))),
        title: Row(children:[
          Container(width:38, height:38, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: EarnTheme.gold, width:1.5)), child: Center(child: Text('EOS', style: TextStyle(color: EarnTheme.gold, fontSize:11, fontWeight: FontWeight.w300)))),
          SizedBox(width:8),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
            Text('EARN OS', style: TextStyle(color: EarnTheme.gold, fontSize:20, fontWeight: FontWeight.bold, letterSpacing:2)),
            Text('Le luxe du monde, livré à Bamako', style: TextStyle(color: Colors.white60, fontSize:10)),
          ]),
        ]),
        actions:[
          IconButton(icon: Icon(Icons.notifications_none, color: EarnTheme.gold, size:26), onPressed: (){}),
          // EARN AI EN HAUT A DROITE COMME META - PAS EN BAS
          GestureDetector(onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const AIAssistantScreen())), child: Container(margin: EdgeInsets.only(right:6), width:36, height:36, decoration: BoxDecoration(color: EarnTheme.gold, shape: BoxShape.circle), child: Center(child: Text('✨', style: TextStyle(fontSize:20))))),
          GestureDetector(onTap: ()=>setState(()=>_index=3), child: Container(margin: EdgeInsets.only(right:12), child: CircleAvatar(radius:18, backgroundColor: EarnTheme.gold, child: Text('Y', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))))),
        ]),
      body: screens[_index],
      // PLUS DE ROBOT AU MILIEU - SUPPRIME DEFINITIVEMENT
      bottomNavigationBar: Container(margin: EdgeInsets.all(12), decoration: BoxDecoration(color: Color(0xFF0F0F0F), border: Border.all(color: EarnTheme.gold.withOpacity(0.6)), borderRadius: BorderRadius.circular(24)), child: BottomNavigationBar(backgroundColor: Colors.transparent, type: BottomNavigationBarType.fixed, elevation:0, selectedItemColor: EarnTheme.gold, unselectedItemColor: Colors.white60, currentIndex: _index, onTap: (i)=>setState(()=>_index=i), items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Explore'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ])),
    );
  }
}
