import 'package:flutter/material.dart';
import '../theme.dart';
class WorldSelectorScreen extends StatelessWidget {
  final Function(Locale) onLocaleChange;
  const WorldSelectorScreen({super.key, required this.onLocaleChange});
  @override Widget build(BuildContext context) {
    return Scaffold(backgroundColor: EarnTheme.black, appBar: AppBar(backgroundColor: EarnTheme.black, title: Text('EARN OS 🌍', style: TextStyle(color: EarnTheme.gold))),
    body: ListView(padding: EdgeInsets.all(16), children: [
      Container(padding: EdgeInsets.all(20), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(16)), child: Column(children: [Text('EARN OS', style: TextStyle(color: EarnTheme.gold, fontSize: 32, fontWeight: FontWeight.bold)), Text('Le luxe du monde, livré à Bamako', style: TextStyle(color: Colors.white))])),
      SizedBox(height: 16),
      Text('Choisis ton pays', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
      Wrap(spacing: 8, children: [
        _country(context, '🇲🇱 Mali', 'fr'), _country(context, '🇸🇳 Sénégal', 'fr'), _country(context, '🇫🇷 France', 'fr'), _country(context, '🇺🇸 USA', 'en'), _country(context, '🇦🇪 Dubai', 'ar'), _country(context, '🇹🇷 Turquie', 'tr'),
      ]),
      SizedBox(height: 16),
      Text('🌍 Marchés du Monde', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
      ListTile(leading: Text('👗', style: TextStyle(fontSize: 28)), title: Text('Haute Couture Paris - €280', style: TextStyle(color: Colors.white)), subtitle: Text('Paris • Livraison 5-7 jours', style: TextStyle(color: EarnTheme.gold))),
      ListTile(leading: Text('🎧', style: TextStyle(fontSize: 28)), title: Text('Headphones USA - \$199', style: TextStyle(color: Colors.white)), subtitle: Text('USA • Livraison 7-10 jours', style: TextStyle(color: EarnTheme.gold))),
      ListTile(leading: Text('🎭', style: TextStyle(fontSize: 28)), title: Text('Art Mali - \$85', style: TextStyle(color: Colors.white)), subtitle: Text('Bamako • Livraison 24h', style: TextStyle(color: EarnTheme.gold))),
      ListTile(leading: Text('👟', style: TextStyle(fontSize: 28)), title: Text('Sneakers Nike - 50.000 FCFA', style: TextStyle(color: Colors.white)), subtitle: Text('Bamako • Livraison 24h', style: TextStyle(color: EarnTheme.gold))),
    ]));
  }
  Widget _country(BuildContext ctx, String label, String code) => ActionChip(label: Text(label), onPressed: () => onLocaleChange(Locale(code)));
}
