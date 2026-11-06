class LanguageService {
  static final List<Map<String,String>> languages = [
    {'code':'fr','flag':'🇫🇷','name':'Français'},
    {'code':'en','flag':'🇺🇸','name':'English'},
    {'code':'bm','flag':'🇲🇱','name':'Bambara'},
    {'code':'ar','flag':'🇦🇪','name':'العربية - Arabe'},
    {'code':'tr','flag':'🇹🇷','name':'Türkçe - Turc'},
    {'code':'es','flag':'🇪🇸','name':'Español - Espagnol'},
    {'code':'pt','flag':'🇵🇹','name':'Português'},
    {'code':'de','flag':'🇩🇪','name':'Deutsch'},
    {'code':'it','flag':'🇮🇹','name':'Italiano'},
    {'code':'zh','flag':'🇨🇳','name':'中文 - Chinois'},
    {'code':'wo','flag':'🇸🇳','name':'Wolof'},
    {'code':'ha','flag':'🇳🇬','name':'Hausa'},
  ];
  static String translate(String key, String lang){
    // EARN AI + App traduisent tout automatiquement
    Map<String,Map<String,String>> t = {
      'hello': {'fr':'Bonjour','en':'Hello','es':'Hola','bm':'I ni ce','ar':'مرحبا','tr':'Merhaba','wo':'Salaam','pt':'Olá','de':'Hallo'},
      'order': {'fr':'Commande','en':'Order','es':'Pedido','bm':'Commande','ar':'طلب','tr':'Sipariş','wo':'Commande','pt':'Pedido','de':'Bestellung'},
      'delivery': {'fr':'Livraison','en':'Delivery','es':'Entrega','bm':'Livraison','ar':'توصيل','tr':'Teslimat','wo':'Livraison','pt':'Entrega','de':'Lieferung'},
      'pay': {'fr':'Payer','en':'Pay','es':'Pagar','bm':'Payer','ar':'ادفع','tr':'Öde','wo':'Payer','pt':'Pagar','de':'Bezahlen'},
    };
    return t[key]?[lang] ?? t[key]!['fr'] ?? key;
  }
}
