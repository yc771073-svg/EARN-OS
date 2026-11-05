import 'package:flutter/material.dart';
class PaymentMethod { final String id, name, icon, country; final bool isMobileMoney; PaymentMethod(this.id,this.name,this.icon,this.country,{this.isMobileMoney=false}); }
class PaymentWorldService {
  static List<PaymentMethod> getMethodsForCountry(String c) {
    switch(c){
      case 'ML': return [PaymentMethod('orange_ml','Orange Money Mali','🟠','ML',isMobileMoney:true), PaymentMethod('wave_ml','Wave Mali','🌊','ML',isMobileMoney:true), PaymentMethod('moov_ml','Moov Money','🔵','ML',isMobileMoney:true), PaymentMethod('visa','Visa / Mastercard','💳','WORLD'), PaymentMethod('paypal','PayPal','🅿️','WORLD')];
      case 'SN': return [PaymentMethod('wave_sn','Wave Sénégal','🌊','SN',isMobileMoney:true), PaymentMethod('orange_sn','Orange Money SN','🟠','SN',isMobileMoney:true), PaymentMethod('visa','Visa / Mastercard','💳','WORLD')];
      case 'FR': return [PaymentMethod('apple_pay','Apple Pay','🍎','FR'), PaymentMethod('google_pay','Google Pay','🅖','FR'), PaymentMethod('visa','Visa / Mastercard','💳','FR'), PaymentMethod('paypal','PayPal','🅿️','WORLD')];
      case 'US': return [PaymentMethod('apple_pay','Apple Pay','🍎','US'), PaymentMethod('paypal','PayPal','🅿️','US'), PaymentMethod('visa','Visa / Mastercard','💳','WORLD')];
      case 'KE': return [PaymentMethod('mpesa','M-Pesa','🟢','KE',isMobileMoney:true), PaymentMethod('visa','Visa / Mastercard','💳','WORLD')];
      default: return [PaymentMethod('visa','Visa / Mastercard','💳','WORLD'), PaymentMethod('paypal','PayPal','🅿️','WORLD'), PaymentMethod('apple_pay','Apple Pay','🍎','WORLD'), PaymentMethod('crypto','Crypto USDT','₮','WORLD')];
    }
  }
  static double getCommissionRate(double eur){ if(eur<50) return 0.05; if(eur<150) return 0.08; if(eur<500) return 0.10; return 0.15; }
  static Future<Map<String,dynamic>> payer({required String methodId, required String methodName, required double amount, required String currency, required String phoneOrEmail, required String brandId}) async {
    await Future.delayed(Duration(seconds: 2));
    double eur = currency=='FCFA'? amount/655 : currency=='USD'? amount/1.08 : amount;
    final rate = getCommissionRate(eur);
    return {'amount':amount,'currency':currency,'paymentMethod':methodId,'paymentMethodName':methodName,'commission':amount*rate,'commissionPercent':'${(rate*100).round()}%','netToBrand':amount-amount*rate-amount*0.10,'livreurPart':amount*0.10,'status':'paid'};
  }
}
