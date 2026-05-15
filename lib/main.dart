import 'dart:convert';
import 'package:api_use/models/api_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
      ),
      home: const MyHomePage(title: 'Flutter Api'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // User user = User(
    //   id: 201,
    //   name: 'Mubeena',
    //   email: 'asiyathmubeena04@gmai.com',
    //   phone: '9995515822',
    //   address: Address(city: 'Kasaragod', street: 'Alampady'),
    // );

    List<User> users=parseList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            User user=users[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person, color: Colors.black, size: 25),
                        SizedBox(width: 20),
                        Text(
                          user.name,
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      user.email,
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(user.phone, style: TextStyle(color: Colors.black)),
                    Text(
                      '${user.address.city + ' , ' + user.address.street} ',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

List<User> parseList() {
String json = '''[
    {"id":100,"name":"abc","phone":"9995515822","email":"abc@gmail.com","address":{"city":"kannur","street":"Alampady"}},
    {"id":101,"name":"efg","phone":"8977552","email":"efg@gmail.com","address":{"city":"ksd","street":"xyz"}},
    {"id":103,"name":"mubi","phone":"9663639275","email":"mubi@gmail.com","address":{"city":"ksd","street":"Naimarmoola"}}
  ]''';
  List<dynamic> rawList = jsonDecode(json);

  List<User> users = rawList.map((item) => User.fromJson(item)).toList();

  return users;
}
