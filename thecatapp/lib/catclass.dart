class Cat {
  num length;
  String fact;
  
  Cat({ 
  required this.length,  
  required this.fact});
  

  factory Cat.fromJson(Map<String, dynamic> cat){
    return Cat(
    length: cat['length'], 
    fact: cat['fact'], 
  );
  }
}