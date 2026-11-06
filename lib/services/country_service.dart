import 'package:flutter/material.dart';
// SERVICE PAYS AUTO - EARN OS détecte le pays et montre les produits du pays
class CountryService {
  // Le pays détecté automatiquement par GPS / SIM / Langue du téléphone
  static String detectCountry(String locale, String simCountry){
    if(simCountry.isNotEmpty) return simCountry;
    if(locale=='fr') return 'ML'; // Par défaut Bamako pour toi
    if(locale=='es') return 'ES';
    if(locale=='ar') return 'AE';
    if(locale=='tr') return 'TR';
    return 'ML';
  }
  static Map<String, Map<String,String>> countries = {
    'ML': {'flag':'🇲🇱','name':'Mali','city':'Bamako','currency':'FCFA'},
    'FR': {'flag':'🇫🇷','name':'France','city':'Paris','currency':'EUR'},
    'AE': {'flag':'🇦🇪','name':'Dubai','city':'Dubai','currency':'AED'},
    'US': {'flag':'🇺🇸','name':'USA','city':'New York','currency':'USD'},
    'ES': {'flag':'🇪🇸','name':'Espagne','city':'Madrid','currency':'EUR'},
    'SN': {'flag':'🇸🇳','name':'Sénégal','city':'Dakar','currency':'FCFA'},
    'CI': {'flag':'🇨🇮','name':"Côte d'Ivoire",'city':'Abidjan','currency':'FCFA'},
    'NG': {'flag':'🇳🇬','name':'Nigeria','city':'Lagos','currency':'NGN'},
    'TR': {'flag':'🇹🇷','name':'Turquie','city':'Istanbul','currency':'TRY'},
  };
  // MARQUES GLOBALES - TOUT LE MONDE LES VOIT PARTOUT
  static List<Map<String,String>> globalBrands = [
    {'name':'Tesla','emoji':'🚗','cat':'Voiture Électrique','price':'€45,000','desc':'Model 3 • Model Y • Livraison mondiale'},
    {'name':'Nike','emoji':'👟','cat':'Sport','price':'€120','desc':'Chaussures • Vêtements • Partout'},
    {'name':'Apple','emoji':'🍎','cat':'Tech','price':'\$999','desc':'iPhone • Mac • Partout'},
    {'name':'Samsung','emoji':'📱','cat':'Tech','price':'\$899','desc':'Galaxy • TV • Partout'},
    {'name':'Chanel','emoji':'💄','cat':'Luxe','price':'€250','desc':'Parfum • Mode • Paris -> Monde'},
    {'name':'Louis Vuitton','emoji':'👜','cat':'Luxe','price':'€1,500','desc':'Sac • Voyage • Paris -> Monde'},
    {'name':'Toyota','emoji':'🚙','cat':'Voiture','price':'€25,000','desc':'Hilux • Land Cruiser • Afrique'},
    {'name':'Sony','emoji':'🎮','cat':'Tech','price':'\$499','desc':'PlayStation • TV • Partout'},
  ];
  // PRODUITS LOCAUX PAR PAYS - AUTO
  static List<Map<String,String>> localProducts(String country){
    if(country=='ML') return [
      {'name':'Bogolan Artisanal','price':'25,000 FCFA','city':'Bamako • Mali','img':'https://images.unsplash.com/photo-1528459801416-a9e53bbf4e17?w=400'},
      {'name':'Mangue Fraîche Bamako','price':'2,500 FCFA','city':'Bamako • Mali','img':'https://images.unsplash.com/photo-1553279768-865429fa0078?w=400'},
      {'name':'Tissu Wax Mali','price':'15,000 FCFA','city':'Bamako • Mali','img':'https://images.unsplash.com/photo-1528459801416-a9e53bbf4e17?w=400'},
    ];
    if(country=='FR') return [
      {'name':'Haute Couture Paris','price':'€280','city':'Paris • France','img':'https://images.unsplash.com/photo-1509631179647-0177331693ae?w=400'},
      {'name':'Parfum Chanel Paris','price':'€150','city':'Paris • France','img':'https://images.unsplash.com/photo-1541643600914-78b084683601?w=400'},
    ];
    if(country=='AE') return [
      {'name':'Montre Or Dubai','price':'AED 1,250','city':'Dubai • UAE','img':'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400'},
      {'name':'Parfum Oud Dubai','price':'AED 500','city':'Dubai • UAE','img':'https://images.unsplash.com/photo-1541643600914-78b084683601?w=400'},
    ];
    if(country=='US') return [
      {'name':'Casque Apple USA','price':'\$199','city':'USA • Tech','img':'https://images.unsplash.com/photo-1505740420928-5e560c06d30e&w=400'},
      {'name':'Tesla Model 3','price':'\$45,000','city':'USA • Tesla','img':'https://images.unsplash.com/photo-1560958089-b8a1929cea89?w=400'},
    ];
    return [
      {'name':'Produit Local','price':'10,000 FCFA','city':'Ton Pays','img':'https://images.unsplash.com/photo-1528459801416-a9e53bbf4e17?w=400'},
    ];
  }
}
