class CountryService {
  static List<Map<String,String>> localProducts(String code) {
    return [
      {'name':'Bogolan - Tissu Traditionnel','city':'Bamako - ACI 2000','price':'25 000 FCFA','img':'https://images.unsplash.com/photo-1523381210434-271e8be1f52b?w=400'},
      {'name':'Tissu Wax - 6 Mètres','city':'Bamako - Marché Rose','price':'15 000 FCFA','img':'https://images.unsplash.com/photo-1594938298603-c8148c4dae35?w=400'},
      {'name':'Dibi - Grill Bamako','city':'Bamako - Badalabougou','price':'5 000 FCFA','img':'https://images.unsplash.com/photo-1544025162-d76694265947?w=400'},
    ];
  }
  static List<Map<String,String>> globalBrands = [
    {'name':'Nike','emoji':'👟','price':'50 000 FCFA'},
    {'name':'Chanel','emoji':'👜','price':'250 000 FCFA'},
    {'name':'Apple','emoji':'📱','price':'450 000 FCFA'},
    {'name':'Louis Vuitton','emoji':'💼','price':'350 000 FCFA'},
    {'name':'Zara','emoji':'👗','price':'35 000 FCFA'},
    {'name':'Samsung','emoji':'📱','price':'280 000 FCFA'},
  ];
}
