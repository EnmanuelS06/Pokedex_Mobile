import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_application/types.dart'; 
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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
       backgroundColor: Colors.grey[200],
       body: Stack(
         children: [
          Positioned(
              top: -50,
              right: -50,
            child: Image.asset("images/pokeball.png", width: 200, fit: BoxFit.fitWidth, color: Colors.white,)
            ),
          const  Positioned(
            top: 100,
            left: 20,
            child: Text(
              "POKEDEX",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),
           ),),
           Positioned(
            top: 150,
            bottom: 0,
            width: width,
             child: Column(
              children:[
                 Pokedex != null ?  Expanded(
                  child: GridView.builder(gridDelegate: 
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                  ), 
                  itemCount: Pokedex.length,
                  itemBuilder: (context, index){
                    var type = Pokedex[index]["type"][0];
                    var number = Pokedex[index]['num'];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      child: Container(  
                        
                        decoration:  BoxDecoration(
                          color: Istypes(type),
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                        ),
                            child: Stack(
                              children:
                              [
                                Positioned(
                                  bottom: -10,
                                  right: -10,
                                  child: 
                                      Image.asset(
                                    'images/pokeball.png', 
                                    height: 100, 
                                    fit: BoxFit.fitHeight )
                                    ),  
                                    Positioned(
                                        top: 10,
                                        left: 20,
                                        child: Text(
                                          "#"+number.toString(),
                                          style: TextStyle(
                                            color: Colors.white
                                          ),
                                        ),
                                    ) ,              
                                  Positioned(
                                    top: 25,
                                    left: 20,
                                    child: Text(
                                    Pokedex[index]['name'],
                                     style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white
                      
                                     ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 50,
                                    left: 20,
                                    child: Container(
                                      
                                      decoration: const  BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        color: Colors.black26,
                      
                                      ),
                                      child:  Padding(
                                        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                                        child: Text(
                                        type.toString(),
                                        style:const  TextStyle(
                                          color: Colors.white
                                        ),
                                       ),
                                      ),
                                    ),
                                  ),
                                Positioned(
                                  bottom: 5,
                                  right: 5,
                                  child: CachedNetworkImage(imageUrl: Pokedex[index]['img'], height: 100, fit: BoxFit.fitHeight,)
                                  ),
                                              
                                
                              ]
                            ),
                        ),
                    );
                  },
                  ),
                ): Center(
                    child: CircularProgressIndicator(),
                ),
              ]
             ),
           ),
         ],//children
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
          print(Pokedex);
            setState(() {
              
            });
          }
          
        
          
      });


  }
}