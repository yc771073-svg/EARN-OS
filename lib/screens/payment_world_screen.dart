import 'package:flutter/material.dart';
import '../theme.dart';
import '../services/payment_world.dart';
class PaymentWorldScreen extends StatefulWidget { const PaymentWorldScreen({super.key}); @override State<PaymentWorldScreen> createState()=>_PaymentWorldScreenState(); }
class _PaymentWorldScreenState extends State<PaymentWorldScreen> {
  String countryCode='ML'; String selected='orange_ml'; double amount=50000; bool paying=false;
  String get currency => countryCode=='ML'||countryCode=='SN'?'FCFA':countryCode=='FR'?'EUR':countryCode=='US'?'USD':'EUR';
  @override Widget build(BuildContext context){
    final methods=PaymentWorldService.getMethodsForCountry(countryCode);
    final sel=methods.firstWhere((m)=>m.id==selected, orElse:()=>methods.first);
    return Scaffold(backgroundColor: EarnTheme.black, appBar: AppBar(backgroundColor: EarnTheme.black, title: Text('Paiement WORLD', style: TextStyle(color: EarnTheme.gold))),
    body: ListView(padding: EdgeInsets.all(16), children: [
      Text('Choisis ton pays', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
      Wrap(spacing:8, children: ['ML','SN','CI','FR','US','KE','AE'].map((c)=>ChoiceChip(label: Text(c), selected: countryCode==c, selectedColor: EarnTheme.gold, onSelected: (_){ setState((){ countryCode=c; selected=PaymentWorldService.getMethodsForCountry(c).first.id; }); })).toList()),
      SizedBox(height:16),
      Text('Montant: ${amount.toInt()} $currency', style: TextStyle(color: Colors.white, fontSize:22, fontWeight: FontWeight.bold)),
      ...methods.map((m)=>GestureDetector(onTap: (){ setState((){ selected=m.id; }); }, child: Container(margin: EdgeInsets.only(bottom:8), padding: EdgeInsets.all(14), decoration: BoxDecoration(color: selected==m.id?EarnTheme.gold:EarnTheme.blackCard, border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(12)), child: Row(children: [Text(m.icon, style: TextStyle(fontSize:26)), SizedBox(width:12), Expanded(child: Text(m.name, style: TextStyle(color: selected==m.id?Colors.black:Colors.white, fontWeight: FontWeight.bold))), if(selected==m.id) Icon(Icons.check_circle, color: Colors.black)])))),
      SizedBox(height:12),
      ElevatedButton(onPressed: paying?null:() async { setState((){ paying=true; }); await PaymentWorldService.payer(methodId: sel.id, methodName: sel.name, amount: amount, currency: currency, phoneOrEmail: '70 00 00 00', brandId: 'brand_123'); setState((){ paying=false; }); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Paiement reussi via ${sel.name}!'), backgroundColor: Colors.green)); }, child: Text(paying?'Paiement...':'PAYER ${amount.toInt()} $currency via ${sel.name}')),
    ]));
  }
}
