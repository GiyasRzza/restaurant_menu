import 'package:flutter/material.dart';
import 'package:restaurant_menu/menus.dart';

class MenuDetails extends StatefulWidget {
  late Menus menus;
   MenuDetails({super.key, required this.menus});

  @override
  State<MenuDetails> createState() => _MenuDetailsState();
}

class _MenuDetailsState extends State<MenuDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor:Colors.limeAccent,
          title:  Text(widget.menus.menuName),
          centerTitle: true,
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Image.asset("images/${widget.menus.ImageName}"),
               Text("${widget.menus.price} \u{20BC}",
                style: const TextStyle(
                    fontSize: 48,color: Colors.blue
                ),
              ),
              const SizedBox(width: 200,height: 50,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.limeAccent,
                ),
                  onPressed: () {
                    print("${widget.menus.menuName} Sifariş edildi");
                  },
                  child: const Text("Sifariş Ver",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20
                  ),
                  )
              )
            ],
          ),
        )
    );
  }
}
