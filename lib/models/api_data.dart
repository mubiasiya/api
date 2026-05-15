import 'package:api_use/models/address.dart';

class User{
  final int id;
  final String name;
  final String email;
  final String phone;
  final Address address;

  User( {required this.id, required this.name, required this.email, required this.phone,required this.address});

factory User.fromJson(Map<String,dynamic> json ){
  return User(id: json['id'],
   name: json['name'],
    email: json['email'],
     phone: json['phone'],
     address:Address.fromJson(json['address'])
     );
}

Map<String ,dynamic> toJson(){
  return{
    'id':id,
    'name':name,
    'email':email,
    'phone':phone,
    'address':address.toJson()

  };
}

}