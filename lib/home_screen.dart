import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 
class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  var pokeapi = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  // ignore: non_constant_identifier_names
   List Pokedex= []; 
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){
      fetchData();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey[200],
       body: Column(
        children:[
           Pokedex.length !=null ?  Expanded(
            child: GridView.builder(gridDelegate: 
            SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.4,
            ), 
            itemCount: Pokedex.length,
            itemBuilder: (context, index){
              return Card(
                  child: Text(
                    Pokedex[index]['name']
                  ),
              );
            },
            ),
          ): Center(

          ),
        ]
       )
    );
  }

  void fetchData() async{
    var url = Uri.http('raw.githubusercontent.com','/Biuni/PokemonGO-Pokedex/master/pokedex.json' );

      var response = await http.get(url);

      http.get(url).then((value) 
      {
         if(value.statusCode == 200){
           var decoded = jsonDecode(value.body);
          Pokedex = decoded['pokemon'];
            setState(() {
              
            });
          }
          
        
          
      });


  }
}