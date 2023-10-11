import 'package:flutter/material.dart';
import 'package:restaurant_menu/menuDetails.dart';

import 'menus.dart';

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

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  Future<List<Menus>> getMenu() async{
      var menusList = <Menus>[];
      var m1 = Menus(1, "Lülə", "kabab.png", 5.5);
      var m2 = Menus(2, "Köftə", "kofte.png", 4.0);
      var m3 = Menus(3, "Cola", "cola.png", 1.2);
      var m4 = Menus(4, "Ayran", "ayran.png", 0.90);
      var m5 = Menus(5, "Çiz Kek", "tort.png", 4.0);
      menusList.add(m1);
      menusList.add(m2);
      menusList.add(m3);
      menusList.add(m4);
      menusList.add(m5);
      return menusList;
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor:Colors.limeAccent,
        title: const Text("Menu"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Menus>>(
        future: getMenu(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var menuList = snapshot.data;
            return ListView.builder(
                  itemCount: menuList?.length,
                  itemBuilder: (context, index) {
                    var menu = menuList?[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MenuDetails(menus:menu )));
                      },
                      child: Card(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 150,
                                height: 150,
                                child: Image.asset("images/${menu!.ImageName}")),

                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(menu.menuName,
                                  style: const TextStyle(
                                    fontSize: 25
                                  ),
                                  ),
                                  const SizedBox(height: 50,),
                                  Text("${menu.price.toString()} \u{20BC}",
                                    style: const TextStyle(
                                      fontSize: 25,color: Colors.blue
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            const Icon(Icons.keyboard_arrow_right_outlined),


                          ],
                        ),
                      ),
                    );
                  },

            );
          }
          else{
            return const Center();
          }


        },


        )
    );
  }
}
