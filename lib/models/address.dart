class Address {
  final String city;
  final String street;

  Address({required this.city, required this.street});

factory Address.fromJson(Map <String,dynamic> json){
  return Address(city: json['city'],
   street: json['street']);

}

Map<String,dynamic> toJson(){
  return{
    'street':street,
    'city':city

  };
}

}
