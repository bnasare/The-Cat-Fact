import 'package:flutter/material.dart';
import 'dart:convert';
import 'catclass.dart';
import 'package:http/http.dart' as http;
void main(){
  runApp(const MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Cat? cat;
  String catfact= "";

  fetchCat() async {
    Uri url= Uri.parse("https://catfact.ninja/fact");

    final response = await http.get(url);

    if (response.statusCode==200){
      final body= json.decode(response.body) as Map<String, dynamic>;
      setState(() {
        cat=Cat.fromJson(body);
        catfact= cat!.fact;
      });
    }else {
      print('Failed to load cat fact');
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

    appBar: AppBar(
      title: const Text('Cat Fact', style: TextStyle(fontWeight:FontWeight.bold, fontSize: 30 ),),
      centerTitle: true,
      automaticallyImplyLeading: false,
      toolbarHeight: 60,
      backgroundColor: Colors.blueAccent,
      shadowColor: Colors.white,
      ),

    body:
      
        Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70,),
              const Center(child: Text("THE FACT ", style: TextStyle(fontSize: 40, color: Colors.white, fontStyle:FontStyle.italic),)), const SizedBox(height:20),
              Text('$catfact', style: TextStyle(fontSize: 20, color: Colors.red, fontStyle:FontStyle.italic),), const SizedBox(height:20),
              
               const SizedBox(height: 100,),
            
            ElevatedButton(onPressed: () => fetchCat(), 
            child: const Center(child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: Text("New Fact", style: TextStyle(fontSize: 20),),
            ))
          )],
            
            
            
            
        
    )
    ),
    backgroundColor: Colors.black,
    );
  }}