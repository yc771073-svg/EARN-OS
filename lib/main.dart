import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/marketplace.dart';
import 'screens/settings.dart';
import 'screens/earn_ai.dart';
import 'screens/cart_order_screen.dart';

void main() => runApp(EarnOSApp());

class EarnOSApp extends StatefulWidget { const EarnOSApp({super.key}); @override State<EarnOSApp> createState()=>_EarnState(); }
class _EarnState extends State<EarnOSApp> {
  Locale _locale = Locale('fr');
  @override Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: EarnTheme.black),
      locale: _locale,
      home: EarnHome(onLocaleChange: (l)=>setState(()=>_locale=l)),
    );
  }
}

class EarnHome extends StatelessWidget {
  final Function(Locale) onLocaleChange;
  const EarnHome({super.key, required this.onLocaleChange});
  @override Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: EarnTheme.black,
      // EN HAUT SEULEMENT - PAS DE BARRE EN BAS COMME UBER
      appBar: AppBar(
        backgroundColor: EarnTheme.black,
        elevation: 0,
        // A GAUCHE: PARAMETRES
        leading: IconButton(icon: Icon(Icons.settings, color: EarnTheme.gold, size: 28), onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>SettingsScreen(onLocaleChange: onLocaleChange)))),
        // AU MILIEU: EARN OS
        title: Row(mainAxisSize: MainAxisSize.min, children:[
          Container(padding: EdgeInsets.all(6), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), shape: BoxShape.circle), child: Text('EOS', style: TextStyle(color: EarnTheme.gold, fontSize:12, fontWeight: FontWeight.bold))),
          SizedBox(width:8),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
            Text('EARN OS', style: TextStyle(color: EarnTheme.gold, fontSize:18, fontWeight: FontWeight.bold, letterSpacing:2)),
            Text('Le luxe du monde, livré à Bamako', style: TextStyle(color: Colors.white60, fontSize:10)),
          ]),
        ]),
        centerTitle: true,
        // A DROITE: CLOCHE + EARN AI + PANIER
        actions: [
          IconButton(icon: Icon(Icons.shopping_bag, color: EarnTheme.gold), onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const CartOrderScreen()))),
          IconButton(icon: Icon(Icons.auto_awesome, color: EarnTheme.gold, size: 28), onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const EarnAIScreen()))),
        ],
      ),
      // PAGE UNIQUE QUI DEFILE - PAS DE BARRE EN BAS
      body: const MarketplaceScreen(),
      // PAS DE bottomNavigationBar - ON L'A SUPPRIME - PLUS COMME UBER
    );
  }
}
