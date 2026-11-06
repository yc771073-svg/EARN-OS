import 'package:flutter/material.dart';
import '../theme.dart';
import '../services/payment_world.dart';
class CartOrderScreen extends StatefulWidget { const CartOrderScreen({super.key}); @override State<CartOrderScreen> createState()=>_CartOrderScreenState(); }
class _CartOrderScreenState extends State<CartOrderScreen> {
  String countryCode='ML'; String selected='orange_ml'; bool paying=false; String status='';
  List<Map<String,String>> cart=[{'name':'Haute Couture Paris','price':'\u20ac280','emoji':'\ud83d\udc57'},{'name':'Headphones USA','price':'\$199','emoji':'\ud83c\udfa7'},{'name':'Art Mali','price':'\$85','emoji':'\ud83c\udfad'}];
  String get currency => countryCode=='ML'?'FCFA':countryCode=='FR'?'EUR':'USD';
  double get total => countryCode=='ML'? 564*655 : 564;
  @override Widget build(BuildContext context){
    final methods=PaymentWorldService.getMethodsForCountry(countryCode);
    final sel=methods.firstWhere((m)=>m.id==selected, orElse:()=>methods.first);
    return Scaffold(backgroundColor: EarnTheme.black, appBar: AppBar(backgroundColor: EarnTheme.black, title: Text('Ma Commande', style: TextStyle(color: EarnTheme.gold))),
    body: ListView(padding: EdgeInsets.all(16), children: [
      Text('Panier (${cart.length})', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
      ...cart.map((i)=>ListTile(leading: Text(i['emoji']!, style: TextStyle(fontSize:30)), title: Text(i['name']!, style: TextStyle(color: Colors.white)), subtitle: Text(i['price']!, style: TextStyle(color: EarnTheme.gold)))),
      SizedBox(height:12), Text('Ton pays', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
      Wrap(spacing:8, children: ['ML','SN','FR','US','KE','AE'].map((c)=>ChoiceChip(label: Text(c), selected: countryCode==c, selectedColor: EarnTheme.gold, onSelected: (_){ setState((){ countryCode=c; selected=PaymentWorldService.getMethodsForCountry(c).first.id; }); })).toList()),
      SizedBox(height:12), Text('Total: ${total.toInt()} $currency', style: TextStyle(color: Colors.white, fontSize:20, fontWeight: FontWeight.bold)),
      SizedBox(height:12), Text('Paie avec le paiement de TON pays', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
      ...methods.map((m)=>GestureDetector(onTap: (){ setState((){ selected=m.id; }); }, child: Container(margin: EdgeInsets.only(bottom:8), padding: EdgeInsets.all(12), decoration: BoxDecoration(color: selected==m.id?EarnTheme.gold:EarnTheme.blackCard, border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(12)), child: Row(children: [Text(m.icon, style: TextStyle(fontSize:24)), SizedBox(width:10), Text(m.name, style: TextStyle(color: selected==m.id?Colors.black:Colors.white, fontWeight: FontWeight.bold))])))),
      SizedBox(height:12),
      ElevatedButton(onPressed: paying?null:() async { setState((){ paying=true; }); await PaymentWorldService.payer(methodId: sel.id, methodName: sel.name, amount: total, currency: currency, phoneOrEmail: '70 00 00 00', brandId: 'order_1'); setState((){ paying=false; status='Commande payee via ${sel.name}! Fournisseur + Livreur notifies.'; }); }, child: Text(paying?'Paiement...':'PAYER MA COMMANDE - ${total.toInt()} $currency via ${sel.name}')),
      if(status.isNotEmpty) Container(margin: EdgeInsets.only(top:12), padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(12)), child: Text(status)),
    ]));
  }
}
